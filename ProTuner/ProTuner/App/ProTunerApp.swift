//
//  ProTunerApp.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/24/25.
//

import SwiftUI

@main
struct ProTunerApp: App {
    var body: some Scene {
        WindowGroup {
            TunerView(viewModel: TunerViewModel())
        }
    }
}
