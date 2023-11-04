//
//  NominationFlow.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Page Coordinator
///
/// Ensures smooth flow depending on user behaviour
struct NominationFlow: View {
    
    private let coordinator: NominationFlowCoordinator
    private let pages: [NominationType]
    
    @State private var currentPage: NominationType
    @State var screenActionHasOccurred = false
    @State var tabSelection = 0
    
    init(pages: [NominationType], coordinator: NominationFlowCoordinator = NominationFlowCoordinator.shared) {
        self.pages = pages
        self.coordinator = coordinator
        self._currentPage = .init(initialValue: coordinator.currentPage)
    }
    
    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                ForEach(pages, id: \.self) { page in
                    if page == currentPage {
                        page.view(coordinator: coordinator, action: showNextPage, screenActionHasOccurred: $screenActionHasOccurred)
                            .transition(AnyTransition.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading))
                            )
                    }
                    
                }
            }
            .tabViewStyle(.page)
        }
        .ignoresSafeArea(.all, edges: [.bottom, .top])
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            if screenActionHasOccurred {
                showNextPage()
            }
        }
    }
    
    private func showNextPage() {
        withAnimation(.easeOut) {
            coordinator.continueToNextScreen()
            currentPage = coordinator.currentPage
        }
    }
}
