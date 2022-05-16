//
//  ViewController.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 13.05.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    private var headerView: HeaderUIView?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CustomViewCell.self, forCellReuseIdentifier:  K.MainScreen.cell)
        return table
    }()
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        
        configureHeaderUIView()
        configureTableViewCells()
        configureRefreshTable()
    }
    
    private func configureRefreshTable() {
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func configureTableViewCells() {
        MainScreenViewModel.shared.fetchUpcomingMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func configureHeaderUIView() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapHeader))
        
        headerView = HeaderUIView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: view.bounds.width,
                                                height: K.MainScreen.headerHeight),
                                  recognizer: recognizer)

        MainScreenViewModel.shared.fetchNowPlayingMovies { [weak self] in
            
            guard let movies = MainScreenViewModel.shared.getNowPlayingMovies() else {
                print("Error getting movies")
                return
            }
            
            DispatchQueue.main.async {
                self?.headerView?.configure(with: movies)
            }
        }
        tableView.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc private func didTapHeader() {
        
        let id = MainScreenViewModel.shared.getNowPlayingMovie(at: headerView?.displayingMovie ?? 0).id
        let vc = MovieDetailScreenViewController()
        vc.movieId = id
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        print("refresh data")
        configureTableViewCells()
        refreshControl.endRefreshing()
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.MainScreen.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainScreenViewModel.shared.paginationLength
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = MainScreenViewModel.shared.getUpcomingMovie(at: indexPath.row).id
        let vc = MovieDetailScreenViewController()
        vc.movieId = id
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.MainScreen.cell, for: indexPath) as? CustomViewCell
        else {
            print("Error")
            return UITableViewCell()
        }
        
        cell.configure(with: MainScreenViewModel.shared.getUpcomingMovie(at: indexPath.row))
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if MainScreenViewModel.shared.paginationLength >= MainScreenViewModel.shared.getUpcomingMovieCount() {
            return
        }
        
        if MainScreenViewModel.shared.paginationLength - 1 == indexPath.row {
            print("paginate, added \(K.MainScreen.paginationAmount) \(MainScreenViewModel.shared.paginationLength)")
            MainScreenViewModel.shared.paginationLength += K.MainScreen.paginationAmount
            
            if MainScreenViewModel.shared.paginationLength >= MainScreenViewModel.shared.getUpcomingMovieCount() {
                MainScreenViewModel.shared.paginationLength = MainScreenViewModel.shared.getUpcomingMovieCount()
            }
            tableView.reloadData()
        }
    }
}
