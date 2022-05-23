//
//  Requests.swift
//  TestApp
//
//  Created by javad on 05.05.22.
//

import Foundation

struct APIRequests {
    
    // request for getting information which shows the balance in account in the first section of the home view controller
    func requestAPIForTotalBillInformation(getData: @escaping([Account]) -> ()) {
        let urlString = "https://61a86c9a387ab200171d3106.mockapi.io/v1/account"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to get data from url: \(error)")
                    return
                }
            }
            guard let data = data else {return}

            do {
                let result = try JSONDecoder().decode([Account].self, from: data)
//                print(result[0].balance!)
                getData(result)

            } catch let decodedError {
                print(decodedError)
            }
        }.resume()

    }
    
    // request for the information about Friends which is placed in the second section of the home view controller
    func requestAPIForFriends(getData: @escaping([Friends]) -> ()) {
        let urlString = "https://61a86c9a387ab200171d3106.mockapi.io/v1/friends"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to get data from url: \(error)")
                    return
                }
            }
            guard let data = data else {return}

            do {
                let result = try JSONDecoder().decode([Friends].self, from: data)
//                print(result[0].avatar!)
                getData(result)
                
            } catch let decodedError {
                print(decodedError)
            }
        }.resume()
        
    }
    
    // requst for the information about statements which showed in the Recent activity section(3rd) of the home view controller
    func requestAPI(getData: @escaping([Activity]) -> ()) {
        let urlString = "https://61a86c9a387ab200171d3106.mockapi.io/v1/statements"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to get data from url: \(error)")
                    return
                }
            }
            guard let data = data else {return}

            do {
                let result = try JSONDecoder().decode([Activity].self, from: data)
//                print(result[0].balance!)
                getData(result)
                
            } catch let decodedError {
                print(decodedError)
            }
        }.resume()
    
    }
    
    //
    func requestAPIForBillList(getData: @escaping([BillList]) -> ()) {
        let urlString = "https://61a86c9a387ab200171d3106.mockapi.io/v1/bill-list"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to get data from url: \(error)")
                    return
                }
            }
            guard let data = data else {return}

            do {
                let result = try JSONDecoder().decode([BillList].self, from: data)
//                print(result[0].thisMonth[1].percent)
                getData(result)
                
            } catch let decodedError {
                print(decodedError)
            }
        }.resume()
        
    }
}
