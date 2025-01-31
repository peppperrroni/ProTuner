//
//  NavigationViewStyle.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/31/25.
//

import SwiftUI

public struct NavigationViewStyle {
    let backgroundColor: UIColor
    let tintColor: UIColor
    let rightBarButtonImage: Image
    let rightBarButtonImageSize: CGSize
    let rightBarButtonInsets: EdgeInsets
}

public extension NavigationViewStyle {
    static func defaultStyle() -> Self {
        Self(
            backgroundColor: .black,
            tintColor: .white,
            rightBarButtonImage: Image(systemName: "gear"),
            rightBarButtonImageSize: .init(width: 36, height: 36),
            rightBarButtonInsets: .init(top: 24, leading: 0, bottom: 0, trailing: 24)
        )
    }
}
