//
//  NominationFormView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationFormView: View {
    
    // MARK: - Strings
    let headerTitle = Content.Title.createNominationTitle
    var nomineeTitle = Content.Title.nomineeNameTitle
    var nomineeDescription = Content.Description.nomineeNameDescription
    var cubesNameTitle = Content.Title.cubesNameTitle
    var nomineeReasoningTitle = Content.Title.nomineeReasoningTitle
    var nomineeReasoningDescription = Content.Description.nomineeReasoningDescription
    var reasoningTitle = Content.Title.reasoningTitle
    var feedbackDescription = Content.Description.feedbackDescription
    var submitButton = Content.ButtonLabel.submit
    var backButton = Content.ButtonLabel.back
    
    @State private var reasoning = ""
    @State private var placeholder = "I'd like to nominate this cube because.."
    @State private var activeSelectedOption = false
    @State private var activeFieldText = false
    @State private var activeRadioButton = false
    @State var nominationSubmitted = false
    @State var backToHome = false
    
    // MARK: - Data
    let options = ["Select Option", "David Jones", "Lorem Ipsum"]
    
    let radioButtonData = [
        RadioButtonViewModel(image: "VeryUnfairIcon", title: "Very Unfair"),
        RadioButtonViewModel(image: "FairIcon", title: "Fair"),
        RadioButtonViewModel(image: "NotSureIcon", title: "Not Sure"),
        RadioButtonViewModel(image: "FairHappyIcon", title: "Fair"),
        RadioButtonViewModel(image: "VeryFairHappyIcon", title: "Very Fair")
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            /* navigation links to screens */
            nominationSubmittedNavigationLink
            backToHomeNavigationLink
            
            /* Reused code implemented for the title */
            HeaderBarView(title: headerTitle)
            ScrollView {
                Image("NominationFormHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 24)
                
                VStack(alignment: .leading) {
                    
                    Text(nomineeTitle)
                        .customSubtitleStyle() // custom modifiers
                    
                    Text(nomineeDescription)
                        .customDescriptionStyle()
                    
                    VStack(alignment: .leading) {
                        
                        /* Reduced amount of code compared to concatenate and ensures customisation */
                        Text("\(Text("* ").foregroundColor(.cubePink2)) \(cubesNameTitle)")
                            .font(Font.custom("Poppins-Bold", size: 16))
                        
                        /* Ability to customise and reuse */
                        PickerView(activeSelectedOption: $activeSelectedOption, options: options)
                            .onTapGesture {
                                activeSelectedOption = true
                            }
                    }
                    .padding(.top, 34)
                    
                    Divider()
                        .overlay(.cubeMidGrey)
                        .padding([.top, .bottom], 34)
                    
                    Text(nomineeReasoningTitle)
                        .customSubtitleStyle()
                    
                    Text(nomineeReasoningDescription)
                        .customDescriptionStyle()
                        .padding(.bottom, 34)
                    
                    /* Reduced amount of code compared to concatenate and ensures customisation */
                    Text("\(Text("* ").foregroundColor(.cubePink2)) \(reasoningTitle)")
                        .font(Font.custom("Poppins-Bold", size: 16))
                
                    TextEditor(text: $reasoning)
                        .border(activeFieldText ? .cubeDarkGrey : .cubeMidGrey)
                        .frame(height: 207)
                        .customDescriptionStyle()
                        .onTapGesture {
                            // border when user clicks on the editor
                            activeFieldText = true
                        }
                        .overlay(
                            /* provides placeholder - disappears when user starts typing */
                            VStack(alignment: .leading) {
                                reasoning.isEmpty ? Text(placeholder) : Text("")
                            }
                                .customDescriptionStyle()
                                .offset(x: 4, y: -86))
                    
                    Divider()
                        .overlay(.cubeMidGrey)
                        .padding([.top, .bottom], 34)
                    
                    /* Reduced amount of code compared to concatenate and ensures customisation */
                    Text("Is how we currently run \( Text("cube of the month").foregroundColor(.cubePink2)) fair?")
                        .customSubtitleStyle()
                    
                    Text(feedbackDescription)
                        .customDescriptionStyle()
                        .padding(.bottom, 34)
                    
                    /* Ability to customise and reuse
                     ForEach reduces the amount of code to create multiple buttons */
                    ForEach(radioButtonData) { data in
                        RadioButtonView(image: data.image, title: data.title)
                    }
                    
                    /* Pushes content up from behind custom tab bar */
                    Spacer(minLength: 120)
                }
                .padding([.leading, .trailing], 16)
            }
            .gesture(
                /* deselectes inputs when user scrolls */
                DragGesture()
                    .onChanged { value in
                        activeSelectedOption = false
                        activeFieldText = false
                    }
            )
        }
        .background(.cubeLightGrey)
        .navigationBarBackButtonHidden(true) // hides back button
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                HStack {
                    CustomBorderButtonView(viewModel: backButtonViewModel, foregroundColor: .black, frameWidth: 100, frameHeight: 48)
                        .padding(.trailing, 14)
                    
                    CustomButtonView(viewModel: submitNominationButtonViewModel, backgroundColor: .cubeMidGrey, foregroundColor: .cubeLightGrey, frameWidth: 200, frameHeight: 50)
                }
            }
                .customTabStyle() // custom modifiers
        )
    }
}

#Preview {
    NominationFormView()
}

/* provides easier maintenance */
extension NominationFormView {
    
    var nominationSubmittedNavigationLink: some View {
        NavigationLink(destination: NominationSubmittedView(),
                       isActive: $nominationSubmitted) {
            EmptyView()
        }
                       .isDetailLink(false)
    }
    
    var backToHomeNavigationLink: some View {
        NavigationLink(destination: ContentView(),
                       isActive: $backToHome) {
            EmptyView()
        }
                       .isDetailLink(false)
    }
}

/* created protocol that holds blueprint of common properties for a button */
private extension NominationFormView {
    
    var submitNominationButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: submitButton,
                              active: .constant(true),
                              action: {
            nominationSubmitted = true
        })
    }
    
    var backButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: backButton,
                              active: .constant(true),
                              action: {
            backToHome = true
        })
    }
}

