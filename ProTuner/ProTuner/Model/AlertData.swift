//
//  AlertData.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/24/25.
//

public struct AlertData {
    let title: String
    let subtitle: String
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    let primaryButtonAction: (() -> Void)?
    let secondaryButtonAction: (() -> Void)?
    var isPresented: Bool
}
