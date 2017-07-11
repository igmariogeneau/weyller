//
//  ViewController.swift
//  Weyller
//
//  Created by eleves on 17-07-11.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var tableView: UITableView!
    let aDict = ["Key1" : "Value1", "Key2" : "Value2", "Key3" : "Value3"]
    var arrayOfKeys: [String] = []

    @IBOutlet weak var aLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        parseDict()
    }
    
    func parseDict() {
        for (key, _) in aDict {
            arrayOfKeys.append(key)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return arrayOfKeys.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"proto")
        cell.textLabel!.text = arrayOfKeys[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.clear
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
        let aKey = arrayOfKeys[indexPath.row]
        aLabel.text = aDict[aKey]
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------

}

