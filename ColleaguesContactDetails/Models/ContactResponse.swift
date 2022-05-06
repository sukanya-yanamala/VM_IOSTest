//
//  ContactResponse.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import Foundation


struct Contact : Codable {
    let id : String?
    let firstName : String?
    let lastName : String?
    let email : String?
    let jobtitle : String?
    let favouriteColor : String?
    let avatar : String?
    let createdAt : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case jobtitle
        case favouriteColor
        case avatar
        case createdAt
    }
}


struct Room : Codable {
    
    let id : String?
    let createdAt : String?
    let isOccupied : Bool?
    //let maxOccupancy : Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case isOccupied
        //case maxOccupancy
    }
    
}

