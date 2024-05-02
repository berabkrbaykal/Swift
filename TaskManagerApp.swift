//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Bera Bekir Baykal on 29.04.2024.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
