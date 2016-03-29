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
        
        let isScopeEqualAll = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex] == "All"
        if searchController.active && (searchController.searchBar.text != "" || !isScopeEqualAll)  {
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
        let isScopeEqualAll = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex] == "All"
        if searchController.active && (searchController.searchBar.text != "" || !isScopeEqualAll) {
            //card = filterCards[indexPath.row]
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
    func filterContentForSearchText(searchText: String, scope: String = "All" ) {
        filterCards = cards.filter {
            card in
            let categoryMatch = (scope == "All") || (card.rating == scope)
            if (scope != "All") {
                return categoryMatch
            } else {
                return categoryMatch && (card.rating.lowercaseString.containsString(searchText.lowercaseString)
                    || card.name.lowercaseString.containsString(searchText.lowercaseString))
            }
        }
        tableView.reloadData()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!,scope: scope)
    }
    
    @IBAction func btnMenuClick(sender: AnyObject) {
//        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//            self.btnMenu.transform = CGAffineTransformMakeRotation(0)
//            self.btnHotel.alpha = 0.9
//            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(-80, -25))
//            self.btnHospital.alpha = 0.9
//            self.btnHospital.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(0, -50))
//            self.btnSM.alpha = 0.9
//            self.btnSM.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(80, -25))
//            }, completion:nil)
        print("you click stone")
    }
    
    
    
    /**
     初始化界面按钮
     */
    func initUI() {

        //0 获取屏幕大小（不包括状态栏高度）
        let viewBounds:CGRect = UIScreen.mainScreen().applicationFrame
        print(viewBounds) //iPhone6输出：（0.0,20.0,375.0,647.0）
        
        //1 设置TableViewCell高度
        if (viewBounds.width > 370 && viewBounds.width < 410) {
            //iphone6时Cell的高度
            self.tableView.rowHeight = 160
        } else if viewBounds.width > 410 {
            //iphone6S时Cell的高度
            self.tableView.rowHeight = 180
        }
        
        //3 初始化各职业按钮状态
        //对三个按钮的设置
        for button in navigationView.subviews {
            button.alpha = 0
        }
        btnRogue.alpha = 1
        btnMage.alpha = 1
        btnPaladin.alpha = 1
        btnWarrior.alpha = 1
        self.btnStone.layer.masksToBounds = true
        self.btnStone.layer.cornerRadius = 14
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.btnStone.alpha = 1 //在一秒的将透明度设置为1
            self.btnStone.transform = CGAffineTransformMakeRotation(0.50 * 3.1415927)
            }, completion: nil)


    }
    
    func btnReset(){
        print("You click button")
    }
    
    func recset() {
        
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let card = cards[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailCard = card
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        */
    }
    
}


extension MasterViewController: UISearchResultsUpdating {
    func updatSearchResultsForSearchControll(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}



extension MasterViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.scopeButtonTitles![selectedScope], scope: searchBar.scopeButtonTitles![selectedScope])
//        print(searchBar.text!)
//        print(searchBar.scopeButtonTitles![selectedScope])
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}




