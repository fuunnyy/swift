//
//  HomeTableViewController.swift
//  S_swift
//
//  Created by Aaron on 2017/8/29.
//  Copyright © 2017年 Aaron. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "abc")
    }
}

extension HomeTableViewController
{
    // MARK: - Table view delegate
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("\(indexPath.section)-----\(indexPath.row)")
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
     let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
     cell.backgroundColor = UIColor.yellow
     return cell
    }
}
