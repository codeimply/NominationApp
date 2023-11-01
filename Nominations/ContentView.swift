//
//  ContentView.swift
//  Nominations
//
//  Created by Sam Davis on 20/10/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
                CustomButton(viewModel: nominationButtonViewModel, backgroundColor: .black, foregroundColor: .white, frameWidth: 340, frameHeight: 50)
            }
                .frame(maxWidth: .infinity)
                .padding(21)
                .background(.white)
                .offset(y: 360)
        )
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    
    var nominationButtonViewModel: ActionButtonViewModel {
        
        /* created protocol that holds blueprint of common properties for a button */
        ActionButtonViewModel(title: "Create new nominations",
                              active: .constant(true),
                              action: {
            
            
        })
    }
}
