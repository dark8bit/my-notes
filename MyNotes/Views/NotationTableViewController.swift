//
//  NotationTableViewController.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 22.09.2022.
//

import UIKit

class NotationTableView: UIViewController {
    lazy var tableView: UITableView = {
        let table = UITableView()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension NotationTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

