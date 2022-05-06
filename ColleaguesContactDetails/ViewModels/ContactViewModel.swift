//
//  ContactViewModel.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import Foundation
import Combine

protocol ContactViewModelProtocol: AnyObject {
    var totalRows :Int { get }
    
    var publisherContacts: Published<[Contact]>.Publisher { get }
    var publisherAvatars: Published<[Int: Data]>.Publisher { get }
    
    
    func getContacts()
    func totalContacts() -> Int
    func getContact(by row: Int) -> Contact?
    func getAvatarData(by id: Int) -> Data?
  
    
}

class ContactViewModel: ContactViewModelProtocol {
   

//    var publisherContacts: Published<[Contact]>.Publisher
    
    var totalRows: Int {contacts.count }
    
    var publisherContacts: Published<[Contact]>.Publisher { $contacts }
    var publisherAvatars: Published<[Int: Data]>.Publisher { $avatars }
    
    
    
    private let networkManager: NetworkManager
    private var subscribers = Set<AnyCancellable>()
    
    @Published private(set) var contacts = [Contact]()
    @Published private(set) var avatars = [Int: Data]()
    
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
  
    
    
    func getContacts() {
        contacts = []
        getContacts(from: NetworkURLs.peopleBaseUrl)
    }
    
    private func getContacts(from url: String) {
      print("aaa")
        networkManager
            .getModel([Contact].self, from: url)
            .sink { completion in
               
            }receiveValue: { [weak self] response in
                let temp = response
                for (i, contact) in temp.enumerated() {
                    self?.contacts.append(contact)
                    self?.downloadAvatar(of: contact.avatar, at: i)
                }
            }
            .store(in: &subscribers)
    }
    
    private func downloadAvatar(of path:String?, at: Int) {
        if((path?.isEmpty) == nil){
            return
        }
        let group = DispatchGroup()
        let url: String? = path!
        print(url!)
        if let avatar = url {
            group.enter()
            networkManager.getData(from: avatar) { data in
                if let data = data {
                    self.avatars.updateValue(data, forKey: at)
                }
                group.leave()
            }
        }
    }
    
    
    func totalContacts() -> Int {
        return contacts.count
    }
    
    func getContact(by row: Int) -> Contact? {
        return contacts[row]
    }
    
    func getAvatarData(by id: Int) -> Data? {
        return avatars[id]
    }
        
}


