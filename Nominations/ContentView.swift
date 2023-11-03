//
//  HomeView.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView<ViewModel: NominationViewModelProtocol>: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var viewModel: ViewModel
    @Binding var screenActionHasOccurred: Bool
    
    @State private var pressed = false
    
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
                CustomButtonView(viewModel: nominationButtonViewModel, backgroundColor: pressed ? .cubeDarkGrey : .black, foregroundColor: .white, borderColor: .black, frameWidth: 340, frameHeight: 48)
            }
                .customTabStyle()
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
private extension ContentView {
    
    var nominationButtonViewModel: ActionButtonViewModel {
        
        ActionButtonViewModel(title: Content.ButtonLabel.createNewNominations,
                              active: .constant(true),
                              action: {
            buttonState()
            viewModel.buttonAction()
        })
    }
}

/* button state - if pressed change colour and return to default */
private extension ContentView {

    func buttonState() {
        pressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            pressed = false
        }
    }
    
}



