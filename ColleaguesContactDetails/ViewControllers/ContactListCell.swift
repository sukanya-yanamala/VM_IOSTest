//
//  ContactListCell.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import UIKit

class ContactListItemCell : UITableViewCell {
    static let identifier = "contactListItem"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private lazy var contactAvatar: UIImageView = {
        let contactAvatar = UIImageView()
        contactAvatar.translatesAutoresizingMaskIntoConstraints = false
//        contactAvatar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        contactAvatar.layer.cornerRadius = 5.0
        contactAvatar.clipsToBounds = true
        return contactAvatar
    }()
    
    private lazy var nameLabel: UILabel = {
        let firstname = UILabel()
        firstname.translatesAutoresizingMaskIntoConstraints = false
        firstname.numberOfLines = 0
        firstname.textAlignment = .left
        firstname.font =  UIFont.boldSystemFont(ofSize: 15.0)
        return firstname
    }()
    
    private lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.text = "ID: "
        return idLabel
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let vView   = UIStackView()
        vView.axis  = .vertical
        vView.distribution  = .fill
        vView.alignment = .leading
        vView.spacing   = 5


        vView.addArrangedSubview(nameLabel)
        vView.addArrangedSubview(idLabel)
        vView.translatesAutoresizingMaskIntoConstraints = false
        
        let hView   = UIStackView()
        hView.axis  = .horizontal
        hView.distribution  = .fill
        hView.alignment = .leading
        hView.spacing   = 5
        hView.addArrangedSubview(contactAvatar)
        hView.addArrangedSubview(vView)
       
        hView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(hView)
        
        let safeArea = contentView.safeAreaLayoutGuide
        // constrain the stack view to all four side of myView
        hView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5).isActive = true
        hView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5).isActive = true
        hView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5).isActive = true
        hView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 5).isActive = true
//        hView.heightAnchor.constraint(equalToConstant: 100 ).isActive = true
//        hView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 30 ).isActive = true
    }
    
    func configureCell(contact: Contact?, avatarData: Data?) {
        
        nameLabel.text = (contact?.firstName)! + " " + (contact?.lastName)!
        idLabel.text = "ID: " + (contact?.id)!
        if(((avatarData?.isEmpty) != nil)){
            contactAvatar.image = UIImage(data: avatarData!)
        }
    }
}
