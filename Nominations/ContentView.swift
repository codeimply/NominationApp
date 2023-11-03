//
//  HomeView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView<ViewModel: NominationViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    @Binding var screenActionHasOccurred: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HeaderBarView()
            /* moved the NotinationsHeaderView() out of ScrollView to make it Sticky */
            NominationsHeaderView()
            
            ScrollView {
                
            }
        }
        .background(.cubeLightGrey)
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                CustomButtonView(viewModel: nominationButtonViewModel, backgroundColor: .black, foregroundColor: .white, frameWidth: 340, frameHeight: 50)
            }
                .customTabStyle()
        )
    }
}

/* created protocol that holds blueprint of common properties for a button */
private extension ContentView {
    
    var nominationButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: Content.ButtonLabel.createNewNominations,
                              active: .constant(true),
                              action: {
            viewModel.buttonAction()
        })
    }
}



