//
//  PickerView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 02/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Custom Picker View.
///
/// Options can be customised as needed.
struct PickerView: View {
    
    @Binding var activeSelectedOption: Bool
    @State var options: [String]
    @State private var selectedOption = "One"
    
    var body: some View {
        
        Rectangle()
            .stroke(activeSelectedOption ? .cubeDarkGrey : .cubeMidGrey, lineWidth: 1)
            .frame(height: 35)
            .overlay (
                ZStack {
                    
                    HStack {
                        Text("\(selectedOption)")
                            .font(Font.custom("Anonymous Pro", size: 16))
                            .frame(width: 310, alignment: .leading)
                        
                        Image(systemName: "chevron.down")
                            .frame(width: 5, height: 5)
                            .fontWeight(.semibold)
                            .foregroundColor(.cubePink2)
                    }
                    
                    HStack {
                        Picker("", selection: $selectedOption) {
                            ForEach(options, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .opacity(0.025)
                        .onChange(of: selectedOption) {
                            activeSelectedOption = false
                        }
                    }
                    
                }
            )
    }
}
