//
//  RadioButtonViewModel.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 02/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

/// Collection of custom data types for radio button data
///
/// Uses identifiable protocol to ensure each object in collection is unique
struct RadioButtonViewModel: Identifiable {
    
    let id = UUID()
    
    var image: String
    var title: String
    var isSelected: Bool = false
}
