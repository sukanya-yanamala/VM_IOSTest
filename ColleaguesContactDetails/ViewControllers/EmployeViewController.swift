//
//  EmployeViewController.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import UIKit
import Combine
import CloudKit

class EmployeViewController: UIViewController {
    
    
    private var viewModel: ContactViewModelProtocol?
    private var subscribers = Set<AnyCancellable>()
    
    
    private lazy var contactListView : UITableView = {
        let contactListView = UITableView()
        contactListView.dataSource = self
        contactListView.delegate = self
        contactListView.register(ContactListItemCell.self, forCellReuseIdentifier: ContactListItemCell.identifier)
        
        contactListView.translatesAutoresizingMaskIntoConstraints = false
        return contactListView
    }()
    
   
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupContollers()
    }
    
    func setupUI() {
        
        view.addSubview(contactListView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        contactListView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40.0).isActive = true
        contactListView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        contactListView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        contactListView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        
       
    }
    
    func setupViewModel(){
        
        let networkManager = MainNetworkManager()
        self.viewModel = ContactViewModel(networkManager: networkManager)
    }
    
    func setupContollers() {
        
        viewModel?
            .publisherContacts
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.contactListView.reloadData()
//                self?.showSegments()
            })
            .store(in: &subscribers)
        
        
        
        viewModel?
            .publisherAvatars
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.contactListView.reloadData()
            })
            .store(in: &subscribers)
        
        
        viewModel?.getContacts()
      
    }
    
}


extension EmployeViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.totalContacts() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contactListView.dequeueReusableCell(withIdentifier: ContactListItemCell.identifier, for: indexPath) as! ContactListItemCell
        let row = indexPath.row
        let contact = viewModel?.getContact(by: row)
        let avatar = viewModel?.getAvatarData(by: row)
        
        
        cell.configureCell(contact: contact, avatarData: avatar)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        showPersonDetails(by: indexPath.row)
        return indexPath
    }
    
    func showPersonDetails(by row: Int){
        let details = EmployeDetailViewController()
        details.setupViewModel(by: viewModel)
        details.displayDetails(by: row)
        self.present(details, animated: true, completion: {
            self.contactListView.reloadData()
         //   self.contactListView.reloadData()
        })
        
        
    }
    
}



