//
//  Defaults+Strings.swift
//  Nominations
//
//  Created by Wiktoria Wylecial on 01/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

/// Global Constant for Strings within the codebase.
///
/// Creates cleaner, readable code, making maintenance easier.
///
/// This can be used for third party resources such as LaunchDarkly or Flagsmith.
struct Content {
    
    struct Title {
        
        static let homeHeaderTitle = "Your nominations"
        static let nominationSubmittedTitle = "Nomination Submitted"
        static let createNominationTitle = "Create a nomination"
        static let nomineeNameTitle = "I’d like to nominate... "
        static let cubesNameTitle = "Cube's name"
        static let nomineeReasoningTitle = "I’d like to nominate this cube because..."
        static let reasoningTitle = "Reasoning"
    }
    
    struct Description {
        
        static let homeEmptyState = "Once you submit a nomination, you will be able to see it here."
        static let nominationSubmittedDescription = "Thank you for taking the time to fill out this form! Why not nominate another cube?"
        static let nomineeNameDescription = "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic."
        static let nomineeReasoningDescription = "Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐"
        static let feedbackDescription = "As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?"
    }
    
    struct ButtonLabel {
        
        static let createNewNominations = "Create new nomination"
        static let backToHome = "Back to home"
        static let submit = "Submit nomination"
        static let back = "Back"
    }
    
    
    
}

