//
//  EmployeDetailViewController.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import UIKit
import Combine

class EmployeDetailViewController : UIViewController {
    
    var viewModel: ContactViewModelProtocol?
    private var subscribers = Set<AnyCancellable>()
    
    func setupViewModel(by viewModel: ContactViewModelProtocol?){
        self.viewModel = viewModel
    }
    
    func displayDetails(by row: Int?){
        let contact = viewModel?.getContact(by: row!)
        nameLabel.text = (contact?.firstName)! + " " + (contact?.lastName)!
        idLabel.text = "ID: " + (contact?.id)!
        emailLabel.text = "Email: " + (contact?.email)!
        jobLabel.text = "JobTitle: " + (contact?.jobtitle)!
        favouriteColorLabel.text = "FavouriteColor: " + (contact?.favouriteColor)!
        createdLabel.text = "Created At: " + (contact?.createdAt)!

        
    }
    
    
    
var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        name.center = CGPoint(x: 160, y: 285)
        name.text = "name"
        name.textColor = .blue
        name.textAlignment = .left
        name.font =  UIFont.boldSystemFont(ofSize: 20.0)
        name.sizeToFit()
        return name
    }()
    
var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.numberOfLines = 0
       idLabel.center = CGPoint(x: 160, y: 285)
       idLabel.textAlignment = .left
       // idLabel.font =  UIFont.boldSystemFont(ofSize: 15.0)
        idLabel.font = .systemFont(ofSize: 15.0)
       idLabel.sizeToFit()
        return idLabel
    }()
    
var emailLabel: UILabel = {
         let emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.numberOfLines = 0
        emailLabel.center = CGPoint(x: 160, y: 285)
        emailLabel.textAlignment = .left
        // emailLabel.textColor = .blue
        emailLabel.font = .systemFont(ofSize: 15.0)
        emailLabel.sizeToFit()
         return emailLabel
     }()
    
var jobLabel: UILabel = {
        let jobLabel = UILabel()
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLabel.numberOfLines = 0
        jobLabel.center = CGPoint(x: 160, y: 285)
        jobLabel.textAlignment = .left
        jobLabel.font =  .systemFont(ofSize: 15.0)
        jobLabel.sizeToFit()
        return jobLabel
    }()
    
var favouriteColorLabel: UILabel = {
        let favouriteColorLabel = UILabel()
        favouriteColorLabel.translatesAutoresizingMaskIntoConstraints = false
        favouriteColorLabel.numberOfLines = 0
        favouriteColorLabel.center = CGPoint(x: 160, y: 285)
        favouriteColorLabel.textAlignment = .left
        favouriteColorLabel.font =  .systemFont(ofSize: 15.0)
        favouriteColorLabel.sizeToFit()
        return favouriteColorLabel
    }()
    
var createdLabel: UILabel = {
        let createdLabel = UILabel()
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        createdLabel.numberOfLines = 0
        createdLabel.center = CGPoint(x: 160, y: 285)
        createdLabel.textAlignment = .left
        createdLabel.font =  .systemFont(ofSize: 15.0)
        createdLabel.sizeToFit()
        return createdLabel
    }()
    
    var roomLabel: UILabel = {
            let roomLabel = UILabel()
        roomLabel.translatesAutoresizingMaskIntoConstraints = false
        roomLabel.numberOfLines = 0
        roomLabel.center = CGPoint(x: 160, y: 285)
        roomLabel.textAlignment = .left
        roomLabel.font =  .systemFont(ofSize: 15.0)
        roomLabel.sizeToFit()
            return roomLabel
        }()
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(nameLabel)
        view.addSubview(idLabel)
        view.addSubview(emailLabel)
        view.addSubview(jobLabel)
        view.addSubview(favouriteColorLabel)
        view.addSubview(createdLabel)
       


        let safeArea = view.safeAreaLayoutGuide

        nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -400.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0).isActive = true
        
     
        
        idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -850.0).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        idLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: -800.0).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0).isActive = true
        
        jobLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: -750.0).isActive = true
        jobLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        jobLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        jobLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0).isActive = true
        
        favouriteColorLabel.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: -700.0).isActive = true
        favouriteColorLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        favouriteColorLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        favouriteColorLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0).isActive = true
        
        createdLabel.topAnchor.constraint(equalTo: favouriteColorLabel.bottomAnchor, constant: -650.0).isActive = true
        createdLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        createdLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0).isActive = true
        createdLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0).isActive = true
        
        

        
    
    }
    
}
