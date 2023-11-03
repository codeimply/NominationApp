//
//  NominationFlowCoordinator.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 03/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.

import Foundation
import SwiftUI

/// Flow Coordindator controlling pages and saves user behaviours
public class NominationFlowCoordinator: ObservableObject {
    
    let userDefaults: UserDefaults
    let currentStageKey: String
    
    public static var shared = NominationFlowCoordinator() // creates one instance of the coordinator that can be shared
    
    var currentPage: NominationType {
        get {
            NominationType(rawValue: userDefaults.integer(forKey: currentStageKey)) ?? .home
        }
        
        set {
            userDefaults.set(newValue.rawValue, forKey: currentStageKey)
        }
    }
    
    var back: Bool {
        get {
            userDefaults.bool(forKey: NominationStatus.back.key)
        }
        
        set {
            userDefaults.set(newValue, forKey: NominationStatus.back.key)
        }
    }
    
    var createNomination: Bool {
        get {
            userDefaults.bool(forKey: NominationStatus.createNewNomination.key)
        }
        
        set {
            userDefaults.set(newValue, forKey: NominationStatus.createNewNomination.key)
        }
    }
    
    var submitNomination: Bool {
        get {
            userDefaults.bool(forKey: NominationStatus.submitNomination.key)
        }
        
        set {
            userDefaults.set(newValue, forKey: NominationStatus.submitNomination.key)
        }
    }
    
    var next: Bool {
        get {
            userDefaults.bool(forKey: NominationStatus.next.key)
        }
        
        set {
            userDefaults.set(newValue, forKey: NominationStatus.next.key)
        }
    }
    
    var leavePage: Bool {
        get {
            userDefaults.bool(forKey: NominationStatus.leavePage.key)
        }
        
        set {
            userDefaults.set(newValue, forKey: NominationStatus.leavePage.key)
        }
    }
    
    init(userDefaults: UserDefaults = UserDefaults.standard, currentStageKey: String = Constant.currentStageKey) {
        self.userDefaults = userDefaults
        self.currentStageKey = currentStageKey
    }
    
    func continueToNextScreen() {
        switch currentPage {
        case .home:
            goToNominationForm()
            
        case .createNomination:
            goToNominationSubmitted()
            
        case .submitNomination:
            flowCompleted()
        }
    }
    
    func goToHomePage() {
        currentPage = .home
    }
    
    func goToNominationForm() {
        currentPage = .createNomination
        
        if next {
            goToNominationSubmitted()
        }
        
        if back {
            goToHomePage()
        }
    }
    
    func goToNominationSubmitted() {
        currentPage = .submitNomination
        
        if createNomination {
            goToNominationForm()
        }
        
        if back {
            goToHomePage()
        }
    }
    
    func flowCompleted() {
        if back {
            goToHomePage()
        }
        
        if createNomination {
            goToNominationForm()
        }
    }
}

private extension NominationFlowCoordinator {
    
    enum Constant {
        static let currentStageKey = "currentStageKey"
    }
}

