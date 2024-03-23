//
//  RadioButtonType.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 22/03/2024.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI


public enum RadioButtonType: Int, CaseIterable {
    
    case veryUnfairIcon
    case fairIcon
    case notSureIcon
    case fairHappyIcon
    case veryFairHappyIcon
    
    public static let fullRadioButtons = RadioButtonType.allCases
}

extension RadioButtonType: Identifiable {
    public var id: RawValue {
        rawValue
    }
}

extension RadioButtonType {
    
    var images: String {
        
        switch self {
        case .veryUnfairIcon:
            return "VeryUnfairIcon"
        case .fairIcon:
            return "FairIcon"
        case .notSureIcon:
            return "NotSureIcon"
        case .fairHappyIcon:
            return "FairHappyIcon"
        case .veryFairHappyIcon:
            return "VeryFairHappyIcon"
        }
    }
    
    var title: String {
        
        switch self {
        case .veryUnfairIcon:
            return "Very Unfair"
        case .fairIcon:
            return "Fair"
        case .notSureIcon:
            return "Not Sure"
        case .fairHappyIcon:
            return "Fair"
        case .veryFairHappyIcon:
            return "Very Fair"
        }
    }
}

