//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Dominique Strachan on 12/19/23.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
