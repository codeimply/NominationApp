//
//  NominationsKitUI.swift
//
//
//  Created by Wiktoria Wylecial on 04/11/2023.
//

import SwiftUI

public struct NominationsKitUI {
  
    public init() {}
    
    @ViewBuilder
    public func nominationsView() -> some View {
        NominationFlow(pages: NominationType.fullNominationFlow)
    }
}
