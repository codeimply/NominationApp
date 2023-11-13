//
//  NominationType.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

/// Creates flow views
public enum NominationType: Int, CaseIterable {
    
    case home
    case createNomination
    case submitNomination
    
    public static let fullNominationFlow = NominationType.allCases
}

extension NominationType: Identifiable {
   
    public var id: RawValue {
        rawValue
    }
}

extension NominationType {
    func viewModel(action: @escaping () -> Void) -> NominationViewModel {
        NominationViewModel(nominationType: self, buttonAction: action)
    }
    
    @ViewBuilder
    func view(coordinator: NominationFlowCoordinator, action: @escaping () -> Void, screenActionHasOccurred: Binding<Bool>, apiViewModel: NomineeManager) -> some View {
        switch self {
            
        case .home:
            ContentView(viewModel: viewModel(action: action),
                        screenActionHasOccurred: screenActionHasOccurred, apiViewModel: apiViewModel)
            
        case .createNomination:
            NominationFormView(viewModel: viewModel(action: action),
                               screenActionHasOccurred: screenActionHasOccurred)
            
        case .submitNomination:
            NominationSubmittedView(viewModel: viewModel(action: action),
                                    screenActionHasOccurred: screenActionHasOccurred)
        }
    }
}
