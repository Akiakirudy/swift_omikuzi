//
//  MyTableViewController.swift
//  omi
//
//  Created by Akira Tachibana on 3/4/21.
//
import UIKit

class MyTableViewController: UITableViewController  {
    
    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var records_array : Array<String>? = nil
    var num : Int = 0
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        NSLog("sections")
        return 1
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("rows")
        records_array = delegate.records
        num = records_array?.count ?? 0
        return num
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        records_array?.forEach { record  in
            cell.textLabel!.text = record
        }
        return cell
    }
}
