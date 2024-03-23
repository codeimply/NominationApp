//
//  FetchNominees.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 04/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

class NomineeManager: ObservableObject {
    
    @Published var nominee: [NomineeData] = []
    
    func retrieveNominees() {
        
        let authToken =  "8uHm3xpDyiyS7vcYDT3BQG8EmKcWp5T9n4HYyvkmdccc4163"
        let url =  URL(string: "https://cube-academy-api.cubeapis.com/api/nominee")!
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //Decode dataResponse received from a network request
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Nominee.self, from: data)
                self.nominee = decoded.data
                
                print(self.nominee.first)
            
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func retrieveAllNominees() {
        
        let authToken =  "8uHm3xpDyiyS7vcYDT3BQG8EmKcWp5T9n4HYyvkmdccc4163"
        let url =  URL(string: "https://cube-academy-api.cubeapis.com/api/nomination")!
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //Decode dataResponse received from a network request
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Nominee.self, from: data)
                self.nominee = decoded.data
                
                print(self.nominee.first)
            
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func postNominee(nomineeId: String, reason: String, process: String) {
        
        let authToken =  "8uHm3xpDyiyS7vcYDT3BQG8EmKcWp5T9n4HYyvkmdccc4163"
        let url =  URL(string: "https://cube-academy-api.cubeapis.com/api/nomination")!
        
        // prepare json data
        let json: [String: Any] = ["nominee_id": nomineeId, "reason": reason, "process": process]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
}
