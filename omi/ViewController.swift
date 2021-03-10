//
//  ViewController.swift
//  omi
//
//  Created by Akira Tachibana on 3/4/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm = try! Realm()
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var label = UILabel()
    let tableView = UITableView()
    var record_array : Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        //realm
        let realm = try! Realm()
        let config = Realm.Configuration(
            schemaVersion: 0,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
            })
        
        Realm.Configuration.defaultConfiguration = config
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let history = realm.objects(History.self)
        
        
        //delegate values
        delegate.records = []
        
        //set label showing your luck
        label.frame = CGRect(x:10 ,y:100, width:300, height: 50)
        label.textAlignment = .center
        label.text = history.first?.result
        self.view.addSubview(label)
        
        
        
        //image
        let image = UIImage(named: "omikuji_box.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 110, y: 200, width: 100, height: 160)
        self.view.addSubview(imageView)
        
        //set button
        let push_button = UIButton(frame: CGRect(x:135, y:400, width: 50, height: 20 ))
        push_button.backgroundColor = .blue
        push_button.setTitle("Push", for: .normal)
        push_button.addTarget(self, action: #selector(pushButtonClicked), for: .touchUpInside)
        self.view.addSubview(push_button)
        
        //menu button
        let menu_button = UIButton(frame: CGRect(x: 270, y: 25, width: 40, height: 40))
        menu_button.setImage(UIImage(named: "menu.png"), for: .normal)
        menu_button.addTarget(self, action: #selector(menuButtonClicked), for: .touchUpInside)
        self.view.addSubview(menu_button)
    
        
    }
    
    @objc func pushButtonClicked(_ sender: Any) {
        let lucks = ["大吉", "中吉", "小吉", "凶"]
        let luck = lucks.randomElement()
        label.text = luck
        //make an array
        record_array.append(label.text!)
        delegate.records = record_array
        
        //realm
        let history = realm.objects(History.self)
        
        //update first row in history
        if let history = history.first {
            try! realm.write {
                history.result = luck!
            }
        }
    }
    
    @objc func menuButtonClicked (_ sender: UIButton) {
            let nextvc = NextVC()
            nextvc.view.backgroundColor = UIColor.blue
            self.present(nextvc, animated: true, completion: nil)
        }
    

}

