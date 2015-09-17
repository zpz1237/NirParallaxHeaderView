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
        
//        imageView.contentMode = UIViewContentMode.ScaleAspectFill
//        imageView.image = UIImage(named: "HeaderImage")
        
        let headerSubview: ParallaxHeaderView = ParallaxHeaderView.parallaxHeaderViewWithSubView(cycleScrollView, forSize: CGSizeMake(self.tableView.frame.width, 150)) as! ParallaxHeaderView
        headerSubview.delegate  = self
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.tableView.tableHeaderView = headerSubview
    }
    
    func lockDirection() {
//        self.tableView.scrollEnabled = false
        self.tableView.contentOffset.y = -114
    }
    
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
        print(index)
    }

    override func  scrollViewDidScroll(scrollView: UIScrollView) {
        let header = self.tableView.tableHeaderView as! ParallaxHeaderView
        header.layoutHeaderViewForScrollViewOffset(scrollView.contentOffset)
        //print(scrollView.contentOffset.y)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    

}
