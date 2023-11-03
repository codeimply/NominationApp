//
//  EmptyState.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Basic Empty State used on home screen.
struct EmptyStateView: View {
    var body: some View {
        
        VStack {
            Image("EmptyState")
                .padding(.bottom, 20)
            
            Text(Content.Description.homeEmptyState)
                .foregroundColor(.cubeDarkGrey)
                .textCase(.uppercase)
                .font(Font.custom("Poppins-Bold", size: 24))
                .multilineTextAlignment(.center)
                .frame(width: 317, height: 162)
        }
    }
}

#Preview {
    EmptyStateView()
}
