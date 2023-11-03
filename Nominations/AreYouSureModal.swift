//
//  AreYouSureModal.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct AreYouSureModal<ViewModel: NominationViewModelProtocol>: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var viewModel: ViewModel
    @Binding var screenActionHasOccurred: Bool
    
    // MARK: - Strings
    var title = Content.Title.areYouSureTitle
    var description = Content.Description.areYouSureDescripiton
    var leavePageButton = Content.ButtonLabel.leavePage
    var cancelButton = Content.ButtonLabel.cancel
    
    @State private var pressed = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .customSubtitleStyle()
                .padding(.bottom, 16)
            
            Text(description)
                .customDescriptionStyle()
            
            Spacer()
        }
        .frame(width: 350)
        .padding(18)
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                VStack {
                    CustomButtonView(viewModel: leavePageButtonViewModel, backgroundColor: .white, foregroundColor: .black, borderColor: pressed ? .cubePink : .black, frameWidth: 340, frameHeight: 48)
                        .padding(.bottom, 6)
                    
                    CustomButtonView(viewModel: cancelButtonViewModel, backgroundColor: .white, foregroundColor: .black, borderColor: pressed ? .cubePink : .black, frameWidth: 340, frameHeight: 48)
                }
            }
                .frame(maxWidth: .infinity)
                .frame(height: 190)
                .background(.white)
                .offset(y: 120)
                .shadow(.strong)
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
private extension AreYouSureModal {
    
    var leavePageButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: leavePageButton,
                              active: .constant(true),
                              action: {
            buttonState()
            NominationFlowCoordinator.shared.back = true
            viewModel.buttonAction()
            dismiss()
        })
    }
    
    var cancelButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: cancelButton,
                              active: .constant(true),
                              action: {
            buttonState()
            dismiss()
        })
    }
}

/* button state - if pressed change colour and return to default */
private extension AreYouSureModal {
    
    func buttonState() {
        pressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            pressed = false
        }
    }
}
