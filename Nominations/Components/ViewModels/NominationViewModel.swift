//
//  NominationViewModel.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

public class NominationViewModel: NominationViewModelProtocol {
    
    public var id: Int
    
    public var buttonAction: () -> Void
    public var nominationType: NominationType

    public init(nominationType: NominationType,
                buttonAction: @escaping () -> Void) {
        self.id = nominationType.rawValue
        self.nominationType = nominationType
        self.buttonAction = buttonAction
    }
}
