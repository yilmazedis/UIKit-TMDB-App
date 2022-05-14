//
//  ViewController.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 13.05.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var headerView: HeaderUIView?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier:  K.MainScreen.cell)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 256))
        tableView.tableHeaderView = headerView
        
        //tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.MainScreen.cell, for: indexPath)
        
        cell.textLabel?.text = "yilmaz"
        
        return cell
    }
    
}
