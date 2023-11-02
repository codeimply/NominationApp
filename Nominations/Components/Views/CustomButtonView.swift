//
//  CustomButton.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Basic custom button for reuse on multiple screens.
struct CustomButtonView: View {
    
    // Use of protocol with common properties
    @ObservedObject var viewModel: ActionButtonViewModel
    
    // Additional properties to customise the colours and size of the button
    let backgroundColor: Color
    let foregroundColor: Color
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    
    init(viewModel: ActionButtonViewModel, backgroundColor: Color, foregroundColor: Color, frameWidth: CGFloat, frameHeight: CGFloat) {
        
        self.viewModel = viewModel
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
    }
    
    var body: some View {
        
        Button(action: {
            viewModel.action()
            
        }, label: {
            Rectangle()
                .foregroundColor(backgroundColor)
                .frame(width: frameWidth, height: frameHeight)
                .overlay(
                    Text(viewModel.title)
                        .foregroundColor(foregroundColor)
                        .textCase(.uppercase)
                        .font(Font.custom("Poppins-Bold", size: 14))
                )
        })
    }
}
