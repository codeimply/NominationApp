//
//  NominationSubmittedView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationSubmittedView<ViewModel: NominationViewModelProtocol>: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var viewModel: ViewModel
    @Binding var screenActionHasOccurred: Bool
    
    // MARK: - Strings
    var submittedHeader = Content.Title.nominationSubmittedTitle
    var submittedTitle = Content.Title.nominationSubmittedTitle
    var submittedDescription = Content.Description.nominationSubmittedDescription
    var createNominationsButton = Content.ButtonLabel.createNewNominations
    var backButton = Content.ButtonLabel.backToHome
    
    @State private var pressed = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            /* Reused code implemented for the title */
            HeaderBarView(title: submittedHeader)
            
            ScrollView {
                Image("NominationSubmittedHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 24)
                
                VStack {
                    Text(submittedTitle)
                        .textCase(.uppercase)
                        .font(Font.custom("Poppins-Bold", size: 32))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                    
                    Text(submittedDescription)
                        .font(Font.custom("Anonymous Pro", size: 16))
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .lineSpacing(10.0)
                    
                }
                .padding([.leading, .trailing], 16)
            }
        }
        .background(.cubeLightGrey)
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                VStack {
                    CustomButtonView(viewModel: createNewNominationButtonViewModel, backgroundColor: pressed ? .cubeDarkGrey : .black, foregroundColor: .white, borderColor: .black, frameWidth: 340, frameHeight: 48)
                        .padding(.bottom, 6)
                    
                    CustomButtonView(viewModel: createNewNominationButtonViewModel, backgroundColor: .white, foregroundColor: .black, borderColor: pressed ? .cubePink : .black, frameWidth: 340, frameHeight: 48)
                }
            }
                .customLargeTabStyle() // custom modifiers
        )
        .onChange(of: scenePhase) { newValue in
            if newValue == .background {
                NominationFlowCoordinator.shared.flowCompleted()
                viewModel.buttonAction()
            }
        }
    }
}

/* created protocol that holds blueprint of common properties for a button */
private extension NominationSubmittedView {
    
    var createNewNominationButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: createNominationsButton,
                              active: .constant(true),
                              action: {
            buttonState()
            NominationFlowCoordinator.shared.createNomination = true
            viewModel.buttonAction()
        })
    }
    
    var backToHomeButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: backButton,
                              active: .constant(true),
                              action: {
            buttonState()
            NominationFlowCoordinator.shared.back = true
            viewModel.buttonAction()
        })
    }
}

/* button state - if pressed change colour and return to default */
private extension NominationSubmittedView {
    
    func buttonState() {
        pressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            pressed = false
        }
    }
}
