//
//  NominationViewModelProtocol.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Protocol for custom button for button actions.
public protocol NominationViewModelProtocol: ObservableObject {

    var nominationType: NominationType { get }
    var buttonAction: () -> Void { get set }
}
