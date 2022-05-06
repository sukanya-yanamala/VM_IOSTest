//
//  RoomViewModel.swift
//  ColleaguesContactDetails
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import Foundation
import Combine

protocol RoomViewModelProtocol: AnyObject {
    var totalRows :Int { get }
    
    var publisherRooms: Published<[Room]>.Publisher { get }
    
    func getRooms()
    func totalRooms() -> Int
    func getRooms(by row: Int) -> Room?
}
    
    class RoomViewModel: RoomViewModelProtocol {
        
        var totalRows: Int {rooms.count }
        
        
        func totalRooms() -> Int {
            return rooms.count
        }
        
        
        func getRooms(by row: Int) -> Room? {
            return (rooms.count > row) ?rooms[row] : nil
        }
        
        
        
        var publisherRooms: Published<[Room]>.Publisher { $rooms }
        
        private let networkManager: NetworkManager
        private var subscribers = Set<AnyCancellable>()
        
        @Published private(set) var rooms = [Room]()
        
        init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
        
        
          func getRooms() {
              rooms = []
              getRooms(from: NetworkURLs.roomsDataUrl)
          }
        
        private func getRooms(from url: String) {
            networkManager
                .getModel([Room].self, from: url)
                .sink { completion in
                   
                }receiveValue: { [weak self] response in
                    let temp = response
                    for (_, room) in temp.enumerated() {
                        self?.rooms.append(room)
                       
                    }
                }
                .store(in: &subscribers)
        }
    }


