//
//  Nominees.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 21/03/2024.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct Nominees: Codable {
    let data: [NomineesData]
}

struct NomineesData: Codable, Identifiable {
    let id = UUID()
    let nomineeID: String
    let firstName: String
    let lastName: String
    
    private enum CodingKeys: String, CodingKey {
        case nomineeID = "nominee_id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
