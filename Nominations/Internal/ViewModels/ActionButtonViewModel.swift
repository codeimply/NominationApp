//
//  ActionButtonViewModel.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

public class ActionButtonViewModel: ActionButtonProtocol {
   
    public var title: String
    @Binding public var active: Bool
    public var action: () -> Void
    
    public init (title: String,
                 active: Binding<Bool>,
                 action: @escaping () -> Void) {
        
        self.title = title
        self._active = active
        self.action = action
    }
}
