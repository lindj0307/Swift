//
//  PagedScrollViewController.swift
//  RWScrollViews
//
//  Created by 林东杰 on 1/12/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class PagedScrollViewController: UIViewController ,UIScrollViewDelegate {
    
    
    // MARK: - Variable
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControll: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
        pageImages = [UIImage(named: "photo1.png")!,
        UIImage(named: "photo2.png")!,
        UIImage(named: "photo3.png")!,
        UIImage(named: "photo4.png")!,
        UIImage(named: "photo5.png")!]
        
        let pageCount = pageImages.count
        
        //2
        pageControll.currentPage = 0
        pageControll.numberOfPages = pageCount
        
        //3
        for _ in 0..<pageCount {
            self.pageViews.append(nil)
        }
        
        //4
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: pagesScrollViewSize.height)
        
        //5
        loadVisiblePages()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView Datasource
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        loadVisiblePages()
    }
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        
        //1
        if let _ = pageViews[page] {
            
        } else {
            //2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            //3 
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            //4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        //First,determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        //Update the page control
        pageControll.currentPage = page
        
        //Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        //Purge anything before the first Page
        for var index = 0 ; index < firstPage ; ++index {
            purgePage(index)
        }
        
        //Load Pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        //Purge anything after the last page
        for var index = lastPage + 1; index < pageImages.count; ++index {
            purgePage(index)
        }
        
    }
    // MARK: - Navigation
    
    




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
