//
//  ProTunerApp.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/24/25.
//

import SwiftUI

@main
struct ProTunerApp: App {
    let contentStyleProvider: ContentStyleProvider
    
    init() {
        self.contentStyleProvider = ContentStyleProvider(navigationViewStyle: .defaultStyle(), tunerViewStyle: .defaultStyle())
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = self.contentStyleProvider.navigationViewStyle.backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: self.contentStyleProvider.navigationViewStyle.tintColor]
        UINavigationBar.appearance().tintColor = self.contentStyleProvider.navigationViewStyle.tintColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(styleProvider: self.contentStyleProvider, tunerViewModel: TunerViewModel())
        }
    }
}
