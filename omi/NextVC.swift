//
//  NextVCViewController.swift
//  omi
//
//  Created by Akira Tachibana on 3/5/21.
//

import UIKit

class NextVC: UIViewController {
    
    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var records_array : Array<String>? = nil
    //var items: [String] = ["a", "a", "a"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initilize table
        let tableView = UITableView(frame: CGRect(x: 0,y: 0,width: self.view.frame.width, height: self.view.frame.height))
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
      
    }
    
}

extension NextVC: UITableViewDelegate, UITableViewDataSource{
    //define table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        records_array = delegate.records
        return self.records_array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.textLabel?.text = records_array?[indexPath.row]
        //cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
}
