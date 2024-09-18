//
//  NominationFormView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Combine
import SwiftUI
import Foundation

struct NominationFormView<ViewModel: NominationViewModelProtocol>: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var apiViewModel = NomineeManager()
    @ObservedObject var nominationFlowCooridnator: NominationFlowCoordinator
    
    @Binding var screenActionHasOccurred: Bool
    
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
    var nextButton = Content.ButtonLabel.next
    
    @State private var reasoning = ""
    @State private var placeholder = "I'd like to nominate this cube because.."
    @State private var activeSelectedOption = false
    @State private var activeFieldText = false
    @State private var activeRadioButton = false
    @State private var selectedOption = false
    @State private var writtenReasoning = false
    @State private var selectedFeedback = false
    @State private var pressed = false
    @State private var showSettings = false
    @State private var settingsDetent = PresentationDetent.medium
    @State private var selectedFeedbackTitle = ""
    @State private var selectedOptionNomineeId = ""
    
    let characterLimit = 280
    
    @State var option = ""
    
    init(viewModel: ViewModel, screenActionHasOccurred: Binding<Bool>, apiViewModel: NomineeManager) {
        self.viewModel = viewModel
        self._screenActionHasOccurred = screenActionHasOccurred
        self.apiViewModel = apiViewModel
        nominationFlowCooridnator = NominationFlowCoordinator.shared
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
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
//                        CustomPickerView(selection: option)
//                        {
//                            ForEach(apiViewModel.nominee, id: \.nomineeID) {
//                                
//                                option = "\($0.firstName) \($0.lastName)"
//        
//                                         }
//                        }
                    
                        
                           
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
                        .onReceive(Just(reasoning)) { _ in limitCharacters(characterLimit) }
                        .border(activeFieldText ? .cubeDarkGrey : .cubeMidGrey)
                        .frame(height: 207)
                        .customDescriptionStyle()
                        .onTapGesture {
                            // border when user clicks on the editor
                            activeFieldText = true
                            
                            if !reasoning.isEmpty {
                                writtenReasoning = true
                            }
                        }
                        .overlay(
                            /* provides placeholder - disappears when user starts typing */
                            VStack(alignment: .leading) {
                                reasoning.isEmpty ? Text(placeholder) : Text("")
                            }
                                .customDescriptionStyle()
                                .offset(x: 4, y: -86)
                        )
                    
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
                    ForEach(RadioButtonType.fullRadioButtons) { data in
                        RadioButtonView(image: data.images, title: data.title)
                    }
                    .onTapGesture {
                        selectedFeedback = true
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
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                HStack {
                    CustomButtonView(viewModel: backButtonViewModel, backgroundColor: .white, foregroundColor: .black, borderColor: pressed ? .cubePink : .black, frameWidth: 100, frameHeight: 48)
                        .padding(.trailing, 14)
                    
                    if !nominationFlowCooridnator.submittedNomination {
                        CustomButtonView(viewModel: submitNominationButtonViewModel, backgroundColor: pressed ? .cubeDarkGrey : .cubeMidGrey, foregroundColor: .cubeLightGrey, borderColor: pressed ? .black : .cubeMidGrey, frameWidth: 200, frameHeight: 48)
                    } else {
                        CustomButtonView(viewModel: nextButtonViewModel, backgroundColor: pressed ? .cubeDarkGrey : .cubeMidGrey, foregroundColor: .cubeLightGrey, borderColor: pressed ? .black : .cubeMidGrey, frameWidth: 200, frameHeight: 48)
                    }
                }
            }
                .customTabStyle() // custom modifiers
        )
        .onDisappear {
            NominationFlowCoordinator.shared.submittedNomination = false
        }
        .sheet(isPresented: $showSettings) {
            AreYouSureModal(viewModel: viewModel, screenActionHasOccurred: $screenActionHasOccurred)
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(0)
                .presentationDragIndicator(.hidden)
        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .background {
                NominationFlowCoordinator.shared.flowCompleted()
                viewModel.buttonAction()
            }
        }
        .onAppear {
            apiViewModel.retrieveNominees()
        }
    }
}

/* created protocol that holds blueprint of common properties for a button */
private extension NominationFormView {
    
    var submitNominationButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: submitButton,
                              active: .constant(true),
                              action: {
            buttonState()
            NominationFlowCoordinator.shared.submittedNomination = true
            
            /* create new nomination */
            //            NomineeManager().postNominee(nomineeId: fetched.nominees?.nomineeId, reason: $reasoning, process: selectedFeedbackTitle)
        })
    }
    
    var backButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: backButton,
                              active: .constant(true),
                              action: {
            if selectedOption || writtenReasoning || selectedFeedback {
                showSettings = true
                buttonState()
            } else {
                buttonState()
                NominationFlowCoordinator.shared.back = true
                viewModel.buttonAction()
            }
        })
    }
    
    var nextButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: nextButton,
                              active: .constant(true),
                              action: {
            buttonState()
            NominationFlowCoordinator.shared.next = true
            viewModel.buttonAction()
        })
    }
}

/* func to limit the characters in FieldEditor */
private extension NominationFormView {
    
    func limitCharacters(_ upper: Int) {
        if reasoning.count > upper {
            reasoning = String(reasoning.prefix(upper))
        }
    }
}

/* button state - if pressed change colour and return to default */
private extension NominationFormView {
    
    func buttonState() {
        pressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            pressed = false
        }
    }
}

