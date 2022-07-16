//
//  NetworkSampleApp.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/06/30.
//

import SwiftUI

@main
struct NetworkSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // ネットワーク監視開始
        NetworkManager.shared.setUp()
        
        return true
    }
}
