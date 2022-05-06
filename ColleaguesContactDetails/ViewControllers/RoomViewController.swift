//
//  RoomViewController.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import UIKit
import Combine
import CloudKit

class RoomViewController: UIViewController {
    
    
    private var viewModel: RoomViewModelProtocol?
    private var subscribers = Set<AnyCancellable>()
    
    
    private lazy var roomListView : UITableView = {
        let roomListView = UITableView()
        roomListView.dataSource = self
        roomListView.delegate = self
        roomListView.register(RoomCell.self, forCellReuseIdentifier: RoomCell.identifier)
        roomListView.translatesAutoresizingMaskIntoConstraints = false
        return roomListView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupContollers()
    }
    
    
    func setupUI() {
        
        view.addSubview(roomListView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        roomListView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40.0).isActive = true
        roomListView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        roomListView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        roomListView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    func setupViewModel() {
        let networkManager = MainNetworkManager()
        self.viewModel = RoomViewModel(networkManager: networkManager)
    }
    
    
    func setupContollers() {
        viewModel?
            .publisherRooms
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.roomListView.reloadData()
            })
            .store(in: &subscribers)
        
        viewModel?.getRooms()
    }
}


extension RoomViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.totalRooms() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = roomListView.dequeueReusableCell(withIdentifier: RoomCell.identifier, for: indexPath) as! RoomCell
        let row = indexPath.row
        let room = viewModel?.getRooms(by: row)
        cell.configureCell(room: room)
        return cell
        
    }
}

