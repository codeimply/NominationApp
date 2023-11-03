//
//  ContentView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var createNomination = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                
                createNominationNavigationLink
                
                HeaderBarView()
                /* moved the NotinationsHeaderView() out of ScrollView to make it Sticky */
                NominationsHeaderView()
                
                ScrollView {
                    
                }
            }
        }
        .background(.cubeLightGrey)
        .navigationBarBackButtonHidden(true)
        .overlay (
            ZStack {
                /* created a component for custom button to reuse in other screens reducing the amount of code */
                CustomButtonView(viewModel: nominationButtonViewModel, backgroundColor: .black, foregroundColor: .white, frameWidth: 340, frameHeight: 50)
            }
                .customTabStyle()
        )
    }
}

/* easier maintenance */
extension ContentView {
    
    var createNominationNavigationLink: some View {
        
        NavigationLink(destination: NominationFormView(),
                       isActive: $createNomination) {
            EmptyView()
        }
                       .isDetailLink(false)
        
    }
}

/* created protocol that holds blueprint of common properties for a button */
private extension ContentView {
    
    var nominationButtonViewModel: ActionButtonViewModel {
    
        ActionButtonViewModel(title: Content.ButtonLabel.createNewNominations,
                              active: .constant(true),
                              action: {
            createNomination = true
        })
    }
}



