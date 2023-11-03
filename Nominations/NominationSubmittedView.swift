//
//  NominationSubmittedView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationSubmittedView: View {
    
//    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            /* Reused code implemented for the title */
            HeaderBarView(title: Content.Title.nominationSubmittedTitle)
            
            ScrollView {
                
                Image("NominationSubmittedHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 24)
                
                VStack {
                    Text(Content.Title.nominationSubmittedTitle)
                        .textCase(.uppercase)
                        .font(Font.custom("Poppins-Bold", size: 32))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                    
                    Text(Content.Description.nominationSubmittedDescription)
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

private extension NominationSubmittedView {
    
    var createNewNominationButtonViewModel: ActionButtonViewModel {
        
        /* created protocol that holds blueprint of common properties for a button */
        ActionButtonViewModel(title: Content.ButtonLabel.createNewNominations,
                              active: .constant(true),
                              action: {
            
            
        })
    }
    
    var backToHomeButtonViewModel: ActionButtonViewModel {
        
        /* created protocol that holds blueprint of common properties for a button */
        ActionButtonViewModel(title: Content.ButtonLabel.backToHome,
                              active: .constant(true),
                              action: {
            
            
        })
    }
}
