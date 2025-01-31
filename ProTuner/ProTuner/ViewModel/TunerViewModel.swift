//
//  TunerViewModel.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/24/25.
//

import Foundation
import SwiftUI

enum Mode: String, CaseIterable, Identifiable {
    case auto = "Auto"
    case manual = "Manual"
    
    var id: String { self.rawValue }
}

protocol TunerViewModelProtocol: ObservableObject {
    var currentMode: Mode { get set }
    var alertData: AlertData { get set }
    func start()
}

final class TunerViewModel: TunerViewModelProtocol {
    
    private let permissionManager: PermissionManagerProtocol
    
    init(permissionManager: PermissionManagerProtocol = PermissionManager()) {
        self.permissionManager = permissionManager
    }
    
    @Published var alertData: AlertData = AlertData(
        title: "Permission is not granted",
        subtitle: "Please grant access to microphone in settings to use the app",
        primaryButtonTitle: "Cancel",
        secondaryButtonTitle: "Go to settings",
        primaryButtonAction: { exit(0) },
        secondaryButtonAction: {
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(appSettings) {
                    UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                }
            }
        },
        isPresented: false
    )
    
    @Published var currentMode: Mode = .auto
    
    func start() {
        switch permissionManager.microphonePermissionStatus {
        case .granted:
            self.startFetchingData()
        case .denied:
            self.alertData.isPresented = true
        case .undetermined:
            self.permissionManager
                .requestMicrophonePermission { result in
                    if result {
                        self.startFetchingData()
                    } else {
                        DispatchQueue.main.async {
                            self.alertData.isPresented = true
                        }
                    }
                }
        }
    }

    private func startFetchingData() {
        self.alertData.isPresented = false
    }
}
