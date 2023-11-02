//
//  NominationFormView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationFormView: View {
    
    @State private var reasoning: String = ""
    @State private var activeSelectedOption = false
    @State private var activeFieldText = false
    @State private var activeRadioButton = false
    
    
    @State private var showPicker = false
    
    var options = ["Select Option", "One", "Two", "Three"]
    @State private var selectedOption = "One"
    
    var body: some View {
        
        VStack(spacing: 0) {
            /* Reused code implemented for the title */
            HeaderBarView(title: "Create a nomination")
            ScrollView {
                
                Image("NominationFormHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 24)
                
                VStack(alignment: .leading) {
                    
                    Text("I’d like to nominate... ")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .padding(.bottom, 6)
                        .textCase(.uppercase)
                    
                    
                    Text("Please select a cube who you feel has done something honourable this month or just all round has a great work ethic.")
                        .font(Font.custom("Anonymous Pro", size: 16))
                        .foregroundColor(.cubeDarkGrey)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5.0)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text("* ")
                                .foregroundColor(.cubePink2) +
                            
                            Text("Cube's name")
                        }
                        .font(Font.custom("Poppins-Bold", size: 16))
                        
                        namePicker
                            .onTapGesture {
                                activeSelectedOption = true
                            }
                        
                        
                    }
                    .padding(.top, 34)
                    
                    Divider()
                        .overlay(.cubeMidGrey)
                        .padding([.top, .bottom], 34)
                    
                    Text("I’d like to nominate this cube because...")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .padding(.bottom, 6)
                        .textCase(.uppercase)
                    
                    Text("Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐")
                        .font(Font.custom("Anonymous Pro", size: 16))
                        .foregroundColor(.cubeDarkGrey)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5.0)
                        .padding(.bottom, 34)
                    
                    HStack {
                        Text("* ")
                            .foregroundColor(.cubePink2) +
                        
                        Text("Reasoning")
                    }
                    .font(Font.custom("Poppins-Bold", size: 16))
                    
                    TextField( "Given Name",
                               text: $reasoning)
                    .border(activeFieldText ? .cubeDarkGrey : .cubeMidGrey)
                    .font(Font.custom("Anonymous Pro", size: 16))
                    .foregroundColor(.cubeDarkGrey)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(5.0)
                    .onTapGesture {
                        activeFieldText = true
                    }
                    
                    Divider()
                        .overlay(.cubeMidGrey)
                        .padding([.top, .bottom], 34)
                    
                    HStack {
                        
                        Text("Is how we currently run ") +
                        
                        Text("cube of the month ")
                            .foregroundColor(.cubePink2) +
                        
                        Text("fair?")
                    }
                    .font(Font.custom("Poppins-Bold", size: 18))
                    .padding(.bottom, 6)
                    .textCase(.uppercase)
                    
                    Text("As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?")
                        .font(Font.custom("Anonymous Pro", size: 16))
                        .foregroundColor(.cubeDarkGrey)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5.0)
                        .padding(.bottom, 34)
                    
                }
                .padding([.leading, .trailing], 16)
                
            }
        }
        .background(.cubeLightGrey)
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                HStack {
                    CustomBorderButtonView(viewModel: backButtonViewModel, foregroundColor: .black, frameWidth: 100, frameHeight: 48)
                        .padding(.trailing, 14)
                    
                    CustomButtonView(viewModel: submitNominationButtonViewModel, backgroundColor: .cubeMidGrey, foregroundColor: .cubeLightGrey, frameWidth: 200, frameHeight: 50)
                }
            }
                .frame(maxWidth: .infinity)
                .padding(21)
                .background(.white)
                .offset(y: 360)
                .shadow(.strong)
        )
    }
}

#Preview {
    NominationFormView()
}

private extension NominationFormView {
    
    var submitNominationButtonViewModel: ActionButtonViewModel {
        
        /* created protocol that holds blueprint of common properties for a button */
        ActionButtonViewModel(title: "Submit nomination",
                              active: .constant(true),
                              action: {
            
            
        })
    }
    
    var backButtonViewModel: ActionButtonViewModel {
        
        /* created protocol that holds blueprint of common properties for a button */
        ActionButtonViewModel(title: "Back",
                              active: .constant(true),
                              action: {
            
            
        })
    }
}

private extension NominationFormView {
    
    var namePicker: some View {
        
        
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
