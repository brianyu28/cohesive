//
//  CohesiveApp.swift
//  Shared
//
//  Created by Brian Yu on 5/11/21.
//

import SwiftUI

@main
struct CohesiveApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: CohesiveDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
