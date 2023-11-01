//
//  ActionButtonProtocol.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Protocol for custom button with common properties.
protocol ActionButtonProtocol: ObservableObject {
    
    var title: String { get set }
    var active: Bool { get set }
    var action: () -> Void { get set }
}
