//
//  View+Styles.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 02/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI


/// Custom Modifiers for Tab and Strings.
///
/// Creates cleaner, readable code, making maintenance easier.
extension View {
    
    func customTabStyle() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .background(.white)
            .offset(y: 360)
            .shadow(.strong)
    }
    
    func customLargeTabStyle() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 240)
            .background(.white)
            .offset(y: 330)
            .shadow(.strong)
    }
    
    func customSubtitleStyle() -> some View {
        self
            .font(Font.custom("Poppins-Bold", size: 18))
            .padding(.bottom, 6)
            .textCase(.uppercase)
    }
    
    func customDescriptionStyle() -> some View {
        self
            .font(Font.custom("Anonymous Pro", size: 16))
            .foregroundColor(.cubeDarkGrey)
            .multilineTextAlignment(.leading)
            .lineSpacing(5.0)
    }
}
