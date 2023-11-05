//
//  Nominee.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 04/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NomineeData: Codable {
    let data: [Nominee]
}

struct Nominee: Codable {
    let nomineeId: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case nomineeId = "nominee_id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

struct CreateNominee: Encodable {
    let nomineeId: String
    let reason: String
    let process: String
}
