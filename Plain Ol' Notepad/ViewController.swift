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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

