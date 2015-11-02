//
//  ViewController.swift
//  MJRefresh
//
//  Created by 林东杰 on 11/2/15.
//  Copyright © 2015 Anta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Variable
    var tableView: UITableView!
    var objectArray = [String]()
    var i = 0
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*  避免界面重叠  */
        self.edgesForExtendedLayout = UIRectEdge.None
        self.tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        
        for (i ; i < 10 ; i++) {
            self.objectArray.append("\(i)")
        }
        
        //self.tableView.ad
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "这是第\(self.objectArray[indexPath.row])行！"
        
        return cell
    }
    //MARK: - Custom Delegate
    
    //MARK: - TableView Datasource
    
    //MARK: - Event Response
    
    //MARK: - Private Methods
    
    //MARK: - Getters/Setters
    
    //TODO: - To Do
    
    //FIXME: - Fix Me
    

    

}

