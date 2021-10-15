//
//  SwiftGUIToolApp.swift
//  SwiftGUITool
//
//  Created by Anzer Arkin on 14.10.21.
//

import SwiftUI

@main
struct SwiftGUIToolApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
