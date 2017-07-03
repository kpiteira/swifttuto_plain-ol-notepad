//
//  ViewController.swift
//  Plain Ol' Notepad
//
//  Created by Karl Piteira on 7/2/17.
//  Copyright © 2017 Karl Piteira. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{
    @IBOutlet weak var table: UITableView!
    var tableData: [String] = ["Salut", "C'est", "moi!", "ou", "toi!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Notes"
        let button:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = button
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    func addNote() {
        tableData.insert("Row \(tableData.count+1)", at: 0)
        let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle != UITableViewCellEditingStyle.delete){
            return
        }
        tableData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

