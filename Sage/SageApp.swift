//
//  SageApp.swift
//  Sage
//
//  Created by Gabriel Celis on 9/16/24.
//

import SwiftUI

@main
struct SageApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return .all
        }
        return .all  // Default fallback
    }
}
