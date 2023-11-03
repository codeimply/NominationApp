//
//  RadioButtonView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 02/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Custom Radio Button View.
///
/// Options can be customised as needed.
struct RadioButtonView: View {
    
    @State var activeRadioButton = false
    @State var image: String
    @State var title: String
    
    var body: some View {
        
        VStack {
            Rectangle()
                .stroke(activeRadioButton ? .cubeDarkGrey : .cubeMidGrey, lineWidth: 1)
                .frame(height: 50)
                .overlay (
                    HStack {
                        Image(image)
                            .frame(width: 25, height: 25, alignment: .leading)
                            .padding(.leading, 12)
                            .padding(.trailing, 14)
                        
                        Text(title)
                            .font(Font.custom("Poppins-Bold", size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(width: 250, alignment: .leading)
                        
                        Circle()
                            .strokeBorder(activeRadioButton ? .cubePink : .cubeDarkGrey, lineWidth: 2)
                            .frame(width: 25, height: 25)
                            .padding(.trailing, 12)
                            .overlay(
                                Circle()
                                    .fill(activeRadioButton ? .cubePink : .clear)
                                    .frame(width: 18, height: 18)
                                    .padding(.trailing, 12)
                            )
                    }
                )
                .onTapGesture {
                    activeRadioButton.toggle()
                }
        }
        .padding(.bottom, 12)
    }
}
