//
//  NetworkSampleApp.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/06/30.
//

import SwiftUI

@main
struct NetworkSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
