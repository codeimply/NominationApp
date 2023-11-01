//
//  CustomBorderButton.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Basic custom button with border for reuse on multiple screens.
struct CustomBorderButton: View {
    
    // Use of protocol with common properties
    @ObservedObject var viewModel: ActionButtonViewModel
    
    // Additional properties to customise the colours and size of the button
    let foregroundColor: Color
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    
    init(viewModel: ActionButtonViewModel, foregroundColor: Color, frameWidth: CGFloat, frameHeight: CGFloat) {
        
        self.viewModel = viewModel
        self.foregroundColor = foregroundColor
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
    }
    
    var body: some View {
        
        Button(action: {
            viewModel.action()
            
        }, label: {
            Rectangle()
                .stroke(.black, lineWidth: 2)
                .frame(width: frameWidth, height: frameHeight)
                .overlay (
                    Text(viewModel.title)
                        .foregroundColor(foregroundColor)
                        .textCase(.uppercase)
                        .font(Font.custom("Poppins-Bold", size: 14))
                )
        })
    }
}

