//
//  RoomCell.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import UIKit

class RoomCell : UITableViewCell {
    static let identifier = "RoomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    private lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        //idLabel.text = "ID: "
        return idLabel
    }()
    
    private lazy var createdLabel: UILabel = {
        let createdLabel = UILabel()
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        return createdLabel
    }()
    
    private lazy var occupiedLabel: UILabel = {
        let occupiedLabel = UILabel()
        occupiedLabel.translatesAutoresizingMaskIntoConstraints = false
        occupiedLabel.textColor = .red
        return occupiedLabel
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        contentView.addSubview(idLabel)
        contentView.addSubview(createdLabel)
        contentView.addSubview(occupiedLabel)
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = contentView.safeAreaLayoutGuide
        
        
        idLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        idLabel.bottomAnchor.constraint(equalTo: createdLabel.topAnchor, constant: -10.0).isActive = true
        
        createdLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: -10.0).isActive = true
        createdLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        createdLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        createdLabel.bottomAnchor.constraint(equalTo: occupiedLabel.topAnchor, constant: -10.0).isActive = true
       
        occupiedLabel.topAnchor.constraint(equalTo: createdLabel.bottomAnchor, constant: -10.0).isActive = true
        occupiedLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        occupiedLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        occupiedLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10.0).isActive = true
       
        
    }
    
    
    func configureCell(room: Room?) {
        idLabel.text = "ID: " + (room?.id)!
        createdLabel.text = "Created At: " + (room?.createdAt)!
        occupiedLabel.text = (room?.isOccupied)! ? "true" :"false"
    }
}
