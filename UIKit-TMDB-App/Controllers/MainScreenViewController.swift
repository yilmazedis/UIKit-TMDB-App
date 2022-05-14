//
//  ViewController.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 13.05.2022.
//

import UIKit
import ImageSlideshow

class MainScreenViewController: UIViewController {
    
    private var headerView: HeaderUIView?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CustomViewCell.self, forCellReuseIdentifier:  K.MainScreen.cell)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
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
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.MainScreen.cell, for: indexPath) as? CustomViewCell
        else {
            print("Error")
            return UITableViewCell()
        }
        
        
        cell.descriptionLabel.text = "Edis"
        cell.titleLabel.text = "Yilmaz"
        cell.dateLabel.text = "15.06.2021"
        cell.posterImage.image = UIImage(named: "Moonrise Kingdom")
//        cell.textLabel?.text = "yilmaz"
//        cell.imageView?.image = UIImage(named: "Moonrise Kingdom")
        cell.accessoryType = .disclosureIndicator
        
        //cell.indentationLevel = 2
                
        return cell
    }
    
}
