//
//  TestTableViewController.swift
//  ParallaxDemo
//
//  Created by Nirvana on 9/11/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController, SDCycleScrollViewDelegate, ParallaxHeaderViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(self.view.frame)
        
        //传入subview
//        let imageView = UIImageView(frame: CGRectMake(0, 0, self.tableView.frame.size.width, 130))
        
        let images = ["1", "2", "3"].map { return UIImage(named: $0)! }
        
        let cycleScrollView = SDCycleScrollView(frame: CGRectMake(0, 0, self.tableView.frame.width, 150), imagesGroup: images)
        
        cycleScrollView.infiniteLoop = true
        cycleScrollView.delegate = self
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated
        cycleScrollView.autoScrollTimeInterval = 2.0;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        cycleScrollView.titlesGroup = ["这是第一张图","然后是第二张","第三张！"]
//        imageView.contentMode = UIViewContentMode.ScaleAspectFill
//        imageView.image = UIImage(named: "HeaderImage")
        
        let headerSubview: ParallaxHeaderView = ParallaxHeaderView.parallaxHeaderViewWithSubView(cycleScrollView, forSize: CGSizeMake(self.tableView.frame.width, 150)) as! ParallaxHeaderView
        headerSubview.delegate  = self
        //headerSubview.headerTitleLabel?.text = "ABCDEFGHIJKLMN"
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
        
        self.tableView.tableHeaderView = headerSubview
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    func lockDirection() {
//        self.tableView.scrollEnabled = false
        self.tableView.contentOffset.y = -154
    }
    
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
        print(index)
    }

    override func  scrollViewDidScroll(scrollView: UIScrollView) {
        
        let color = UIColor(red: 0/255.0, green: 139/255.0, blue: 255/255.0, alpha: 1)
        let offsetY = scrollView.contentOffset.y
        //print(offsetY)
        //print(self.view.frame.height)
        if offsetY > 20 {
            //print("开始了")
            let alpha = min(1, 1 - ((20 + 64 - offsetY) / 64))
            self.navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(alpha))
        } else {
            self.navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
        
        let header = self.tableView.tableHeaderView as! ParallaxHeaderView
        header.layoutHeaderViewForScrollViewOffset(scrollView.contentOffset)
        print(header.headerTitleLabel?.frame)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = "AAAAAAA"
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    

}
