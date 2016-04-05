//
//  MasterViewController.swift
//  TrumpsArenaTierList
//
//  Created by 林东杰 on 3/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    // MARK: - Constants
    let DEFAULTSTRING = "All";
    // MARK: - Variables
    @IBOutlet weak var btnStone: UIButton!
    @IBOutlet weak var btnRogue: UIButton!
    @IBOutlet weak var btnMage: UIButton!
    @IBOutlet weak var btnWarrior: UIButton!
    @IBOutlet weak var btnPaladin: UIButton!
    @IBOutlet weak var btnPriest: UIButton!
    @IBOutlet weak var btnShaman: UIButton!
    @IBOutlet weak var btnWarlock: UIButton!
    @IBOutlet weak var btnDurid: UIButton!
    @IBOutlet weak var btnHunter: UIButton!
    @IBOutlet weak var btnNature: UIButton!
    
    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    
    var detailViewController: DetailViewController? = nil
    let searchController = UISearchController(searchResultsController: nil)
    var cards = [Card]()
    var filterCards = [Card]()
    var list: NSArray?
    
    var role : String = "All"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        /*
        有效
        let Chapterpath = NSBundle.mainBundle().pathForResource("filter", ofType: "plist")
        let dict2 = NSDictionary(contentsOfFile: Chapterpath!)
        */
        let chapterPath = NSBundle.mainBundle().pathForResource("filter", ofType: "plist")
        list = NSArray(contentsOfFile: chapterPath!)
        for item in list! {
            let card = Card(code: Int(item.valueForKey("code")! as! NSNumber),
                name: String(item.valueForKey("name")! as! String),
                category: String(item.valueForKey("category")! as! String),
                rating: String(item.valueForKey("rating")! as! String),
                describe: String(item.valueForKey("describe")! as! String),
                url: String(item.valueForKey("url")! as! String))
            cards.append(card)
        }
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        searchController.searchBar.scopeButtonTitles = ["All","S","A","B","C","D","E"]
        searchController.searchBar.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    override func viewWillAppear(animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableView Data Source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let isRoleEqualAll = role == self.DEFAULTSTRING
        let isScopeEqualAll = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex] == self.DEFAULTSTRING
        if (searchController.active && (searchController.searchBar.text != "" || !isScopeEqualAll))
            || !isRoleEqualAll {
            if (filterCards.count % 3 > 0) { return filterCards.count / 3 + 1 }
            return filterCards.count / 3
        }
        if (cards.count % 3 > 0) { return cards.count / 3 + 1 }
        return cards.count / 3
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CardTableViewCell
        
        //var firstCard,secondCard,thirdCard :Card
        var firstCard = Card(code: 0, name: "", category: "", rating: "", describe: "", url: "")
        var secondCard = Card(code: 0, name: "", category: "", rating: "", describe: "", url: "")
        var thirdCard  = Card(code: 0, name: "", category: "", rating: "", describe: "", url: "")
        let isRoleEqualAll = role == self.DEFAULTSTRING
        let isScopeEqualAll = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex] == self.DEFAULTSTRING
        if (searchController.active && (searchController.searchBar.text != "" || !isScopeEqualAll))
            || !isRoleEqualAll {
            firstCard = filterCards[indexPath.row*3]
            if (indexPath.row*3+1 < filterCards.count) {
                secondCard = self.filterCards[indexPath.row*3+1] }
            if (indexPath.row*3+2 < filterCards.count) {
                thirdCard = self.filterCards[(indexPath.row)*3+2] }
        } else {
            firstCard = cards[(indexPath.row)*3]
            if ((indexPath.row)*3+1 < cards.count) {
                secondCard = self.cards[(indexPath.row)*3+1] }
            if ((indexPath.row)*3+2 < cards.count) {
                thirdCard = self.cards[(indexPath.row)*3+2] }
        }

        ImageLoader.sharedLoader.imageForUrl(firstCard.url, completionHandler:{(image: UIImage?, url: String) in
            cell.firstImage.image = image
        })
        if (secondCard.url == "") {
            cell.secondImage.image = nil
        } else {
            ImageLoader.sharedLoader.imageForUrl(secondCard.url, completionHandler:{(image: UIImage?, url: String) in
                cell.secondImage.image = image
            })
        }
        if (thirdCard.url == "") {
            cell.thirdImage.image = nil
        } else {
            ImageLoader.sharedLoader.imageForUrl(thirdCard.url, completionHandler:{(image: UIImage?, url: String) in
                cell.thirdImage.image = image
            })
        }
        return cell
    }
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func filterContentForSearchText(searchText: String, scope: String = "All" ,role: String = "All") {
        filterCards = cards.filter {
            card in
            //先判断是否有选择职业
            if role != self.DEFAULTSTRING {
                //有选择职业的处理方法
                if card.category != role {
                    //职业不对的直接过滤掉
                    return false
                }
                //分类是all时返回选中职业的卡片
                if scope == self.DEFAULTSTRING  && searchText == "" {
                    return card.category == role
                } else if scope == self.DEFAULTSTRING  && searchText != "" {
                    return card.category == role &&
                        (card.rating.lowercaseString.containsString(searchText.lowercaseString)
                            || card.name.lowercaseString.containsString(searchText.lowercaseString))
                }
                //分类不是all时判断是否有填写过滤条件
                if searchText == "" {
                    //返回选中职业对应评分的卡片
                    return card.rating == scope && card.category == role
                }
                //返回选中职业对应过滤条件的卡片
                return card.category == role && card.rating == scope &&
                    (card.rating.lowercaseString.containsString(searchText.lowercaseString)
                    || card.name.lowercaseString.containsString(searchText.lowercaseString))
            } else {
                //没有选择职业的处理方法
                // 搜索条件为空时
                if searchText == "" {
                    if scope == self.DEFAULTSTRING {
                        return true
                    }
                    return card.rating == scope
                }
                
                if scope == self.DEFAULTSTRING {
                    return card.rating.lowercaseString.containsString(searchText.lowercaseString)
                        || card.name.lowercaseString.containsString(searchText.lowercaseString)
                        || card.category.lowercaseString.containsString(searchText.lowercaseString)
                }
                return card.rating == scope && (card.rating.lowercaseString.containsString(searchText.lowercaseString)
                    || card.name.lowercaseString.containsString(searchText.lowercaseString)
                    || card.category.lowercaseString.containsString(searchText.lowercaseString))
            }
        }
        tableView.reloadData()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!,scope: scope,role: role)
    }
    
    @IBAction func btnStoneClick(sender: AnyObject) {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            //旋转90度
            self.btnStone.transform = CGAffineTransformMakeRotation(0.25 * 3.1415927)
            
            self.btnPriest.transform = CGAffineTransformMakeRotation(0)
            self.btnPriest.alpha = 1
            self.btnPriest.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0,1.0), CGAffineTransformMakeTranslation(-44, 0))
            self.btnShaman.alpha = 1
            self.btnShaman.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0,1.0), CGAffineTransformMakeTranslation(0, 0))
            self.btnWarlock.alpha = 1
            self.btnWarlock.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0,1.0), CGAffineTransformMakeTranslation(44, 0))
            self.btnRogue.alpha = 0
            self.btnMage.alpha = 0
            
            self.btnDurid.transform = CGAffineTransformMakeRotation(0)
            self.btnDurid.alpha = 1
            self.btnDurid.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0,1.0), CGAffineTransformMakeTranslation(-44, 0))
            self.btnHunter.alpha = 1
            self.btnHunter.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0,1.0), CGAffineTransformMakeTranslation(0, 0))
            self.btnNature.alpha = 1
            self.btnNature.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0,1.0), CGAffineTransformMakeTranslation(44, 0))
            self.btnPaladin.alpha = 0
            self.btnWarrior.alpha = 0
            }, completion:nil)
    }
    
    
    
    /**
     初始化界面按钮
     */
    func initUI() {

        //1 获取屏幕大小（不包括状态栏高度）
        let viewBounds:CGRect = UIScreen.mainScreen().applicationFrame
        
        //2 设置TableViewCell高度
        if (viewBounds.width > 370 && viewBounds.width < 410) {
            //iphone6时Cell的高度
            self.tableView.rowHeight = 160
        } else if viewBounds.width > 410 {
            //iphone6S时Cell的高度
            self.tableView.rowHeight = 180
        }
        
        //3 初始化各职业按钮状态
        resetUI()
        self.btnStone.layer.masksToBounds = true
        self.btnStone.layer.cornerRadius = 14
        UIView.animateWithDuration(1, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            //在一秒的将透明度设置为1
            self.btnStone.alpha = 1
            }, completion: nil)
    }
    
    @IBAction func buttonReset(sender: AnyObject) {
        
        /*
        case Durid = 1
        case Mage = 2
        case Paladin = 3
        case Priest = 4
        case Rogue = 5
        case Shaman = 6
        case Warrior = 7
        case Hunter = 8
        case Warlock = 9
        case Nature = 10
        */
        let btnTag = sender.tag!
        switch btnTag {
        case 0:
            break
        case 1:
            role = "Durid"
            break
        case 2:
            role = "Mage"
            break
        case 3:
            role = "Paladin"
            break
        case 4:
            role = "Priest"
            break
        case 5:
            role = "Rogue"
            break
        case 6:
            role = "Shaman"
            break
        case 7:
            role = "Warrior"
            break
        case 8:
            role = "Hunter"
        case 9:
            role = "Warlock"
            break
        case 10:
            role = "Nature"
            break
        default:
            role = self.DEFAULTSTRING
            break
        }
        let scope = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope,role: role)
        resetUI()
    }
    
    /**
     将按钮设置为初始状态
     */
    func resetUI() {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            //旋转90度
            self.btnStone.transform = CGAffineTransformMakeRotation(-0.25 * 3.1415927)
            //动画回归原始位置
            self.btnPriest.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, 0))
            self.btnPriest.alpha = 0
            self.btnShaman.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, 0))
            self.btnShaman.alpha = 0
            self.btnWarlock.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1 ), CGAffineTransformMakeTranslation(0, 0))
            self.btnWarlock.alpha = 0
            self.btnRogue.alpha = 1
            self.btnMage.alpha = 1
            
            self.btnDurid.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, 0))
            self.btnDurid.alpha = 0
            self.btnHunter.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, 0))
            self.btnHunter.alpha = 0
            self.btnNature.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1 ), CGAffineTransformMakeTranslation(0, 0))
            self.btnNature.alpha = 0
            self.btnWarrior.alpha = 1
            self.btnPaladin.alpha = 1
            
            }, completion: nil)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                var firstCard = Card(code: 0, name: "", category: "", rating: "", describe: "", url: "")
                var secondCard = Card(code: 0, name: "", category: "", rating: "", describe: "", url: "")
                var thirdCard  = Card(code: 0, name: "", category: "", rating: "", describe: "", url: "")
                let isRoleEqualAll = role == self.DEFAULTSTRING
                let isScopeEqualAll = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex] == self.DEFAULTSTRING
                if (searchController.active && (searchController.searchBar.text != "" || !isScopeEqualAll))
                    || !isRoleEqualAll {
                        firstCard = filterCards[indexPath.row*3]
                        if (indexPath.row*3+1 < filterCards.count) {
                            secondCard = self.filterCards[indexPath.row*3+1] }
                        if (indexPath.row*3+2 < filterCards.count) {
                            thirdCard = self.filterCards[(indexPath.row)*3+2] }
                } else {
                    firstCard = cards[(indexPath.row)*3]
                    if ((indexPath.row)*3+1 < cards.count) {
                        secondCard = self.cards[(indexPath.row)*3+1] }
                    if ((indexPath.row)*3+2 < cards.count) {
                        thirdCard = self.cards[(indexPath.row)*3+2] }
                }
                controller.firstCard = firstCard
                controller.secondCard = secondCard
                controller.thirdCard = thirdCard
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}


extension MasterViewController: UISearchResultsUpdating {
    func updatSearchResultsForSearchControll(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope,role: role)
    }
}



extension MasterViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope,role: role)
    }
}




