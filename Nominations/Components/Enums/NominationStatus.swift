//
//  NominationStatus.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

/// Enum holding possible app behaviours
public enum NominationStatus: Int {
    
    case createNewNomination
    case back
    case submitNomination
    case next
    case leavePage
    case allFieldsValid
}


public extension NominationStatus {
    
    var key: String {
        
        switch self {
        case .createNewNomination:
            return "CreateNewNomination"
        case .back:
            return "Back"
        case .submitNomination:
            return "SubmitNomination"
        case .next:
            return "Next"
        case .leavePage:
            return "LeavePage"
        case .allFieldsValid:
            return "AllFieldsValid"
        }
    }
}
