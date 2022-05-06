//
//  ColleaguesContactDetailsTests.swift
//  ColleaguesContactDetailsTests
//
//  Created by Sukanya Yanamala on 06/05/2022.
//

import XCTest
import Combine
@testable import ColleaguesContactDetails


class ColleaguesContactDetailsTests: XCTestCase {

    private var subscribers = Set<AnyCancellable>()
    
    func testGetContacts_Success() throws {
        //Given
    let fakeNetworkManager = FakeNetworkManager()
        let data = try getDataFrom(jsonFile: "contact_data")
        fakeNetworkManager.data = data
        var viewModel = ContactViewModel(networkManager: fakeNetworkManager)
        let expectation = expectation(description: "sucess expectation")
        var contacts: [Contact] = []
        
        //When
        viewModel.getContacts()
        viewModel
            .$contacts
            .sink { response in
                contacts = response
                expectation.fulfill()
            }
            .store(in: &subscribers)
        //Then
        
        waitForExpectations(timeout: 2.0)
        XCTAssertEqual(contacts.count, 67)
        
        func setUpWithError() throws {
        viewModel = ContactViewModel(networkManager: fakeNetworkManager)
    }
    }

    

}
private func getDataFrom(jsonFile: String) throws -> Data {
    let bundle = Bundle(for: ColleaguesContactDetailsTests.self)
    guard let url = bundle.url(forResource: jsonFile, withExtension: "json")
    else { fatalError("url \(jsonFile) could not be loaded") }
    return try Data(contentsOf: url)
}


