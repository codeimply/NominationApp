//
//  NominationSubmittedView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationSubmittedView: View {
    
    // MARK: - Strings
    var submittedHeader = Content.Title.nominationSubmittedTitle
    var submittedTitle = Content.Title.nominationSubmittedTitle
    var submittedDescription = Content.Description.nominationSubmittedDescription
    var createNominationsButton = Content.ButtonLabel.createNewNominations
    var backButton = Content.ButtonLabel.backToHome
    
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
        .navigationBarBackButtonHidden(true)
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                VStack {
                    CustomButtonView(viewModel: createNewNominationButtonViewModel, backgroundColor: .black, foregroundColor: .white, frameWidth: 340, frameHeight: 50)
                        .padding(.bottom, 6)
                    
                    CustomBorderButtonView(viewModel: backToHomeButtonViewModel, foregroundColor: .black, frameWidth: 340, frameHeight: 48)
                }
            }
                .customLargeTabStyle() // custom modifiers
        )
    }
}

#Preview {
    NominationSubmittedView()
}

/* created protocol that holds blueprint of common properties for a button */
private extension NominationSubmittedView {
    
    var createNewNominationButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: createNominationsButton,
                              active: .constant(true),
                              action: {
            
            
        })
    }
    
    var backToHomeButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: backButton,
                              active: .constant(true),
                              action: {
            
            
        })
    }
}
