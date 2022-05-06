//
//  SegmentedViewController.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import Foundation
import UIKit


class SegmentedViewController: UIViewController {
    
    var employeeView : UIView!
    var roomView : UIView!

    
    private lazy var  segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["ContactDetails", "Rooms"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    @objc func handleSegmentChange(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.employeeView.isHidden = false
            self.roomView.isHidden = true
        case 1:
            self.employeeView.isHidden = true
            self.roomView.isHidden = false
        default:
            self.view.backgroundColor = .purple
        }
    }
    
//    viewcontrollerforse
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        let employeViewController = EmployeViewController()
        self.addChild(employeViewController)
        let roomViewController = RoomViewController()
        self.addChild(roomViewController)
        
        employeeView = employeViewController.view
        roomView = roomViewController.view
        
        view.addSubview(employeeView!)
        view.addSubview(roomView!)
        view.addSubview(segmentedControl)


        view.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        employeeView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        employeeView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        employeeView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true

        roomView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        roomView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        roomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        self.employeeView.isHidden = false
        self.roomView.isHidden = true
    }
}
