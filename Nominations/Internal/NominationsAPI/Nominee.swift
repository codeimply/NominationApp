//
//  Nominee.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 04/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

//import Foundation
//
//struct Nominee: Codable {
//    let data: [NomineeData]
//}
//
//struct NomineeData: Codable, Identifiable, Equatable {
//    let id = UUID()
//    let nomineeID: String
//    let firstName: String
//    let lastName: String
//    
//    private enum CodingKeys: String, CodingKey {
//        case nomineeID = "nominee_id"
//        case firstName = "first_name"
//        case lastName = "last_name"
//    }
//}
//
//

//
//struct Response: Decodable, Identifiable {
//
//    private enum CodingKeys: String, CodingKey { case message, status }
//     let id = UUID()
//
//    let dogs: [Dog]
//    let status: String
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        status = try container.decode(String.self, forKey: .status)
//        let message = try container.decode([String:[String]].self, forKey: .message)
//        dogs = message.map(Dog.init).sorted{$0.name < $1.name}
//    }
//}

//    enum CodingKeys: String, CodingKey {
//        case nomineeId = "nominee_id"
//        case firstName = "first_name"
//        case last_name = "last_name"
//    }
//}

//extension Nominee {
//    init?(json: [String: Any]) {
//        guard let datasJSON = json["data"] as? [String]
//
//        else {
//            return nil
//        }
//
//        var datas: Set<Datas> = []
//            for string in datasJSON {
//                guard let data = Datas(rawValue: string) else {
//                    return nil
//                }
//
//                datas.insert(data)
//            }
//
//        self.datas = datas
//    }
//}



//
//struct CreateNominee: Encodable {
//    let nomineeId: String
//    let reason: String
//    let process: String
//}
