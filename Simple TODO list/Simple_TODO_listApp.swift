//
//  Simple_TODO_listApp.swift
//  Simple TODO list
//
//  Created by Jeffrey Klinkhamer on 23/03/2023.
//

import SwiftUI

@main
struct Simple_TODO_listApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
