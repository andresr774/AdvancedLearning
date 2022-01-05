//
//  AdvancedLearningApp.swift
//  AdvancedLearning
//
//  Created by Andres camilo Raigoza misas on 24/12/21.
//

import SwiftUI

@main
struct AdvancedLearningApp: App {
    
    let currentUserIsSignedIn: Bool
    
    init() {
        //let userIsSignedIn = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        let userIsSignedIn = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
        //let value = ProcessInfo.processInfo.environment["-UITest_startSignedIn2"]
        //let userIsSignedIn = value == "true" ? true : false
        self.currentUserIsSignedIn = userIsSignedIn
        print("USER IS SIGNED IN: \(userIsSignedIn)")
    }
    
    var body: some Scene {
        WindowGroup {
            UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
            //AdvancedCombineBootcamp()
        }
    }
}
