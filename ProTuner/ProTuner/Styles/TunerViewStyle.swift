//
//  TunerViewStyle.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/31/25.
//

import SwiftUI

public struct TunerViewLayout {
    let titleInsets: EdgeInsets
}

public struct TunerViewStyle {
    let layout: TunerViewLayout
    let backgroundColor: Color
    let titleFont: Font
    let titleColor: Color
    let segmentControlFont: Font
    let selectedSegmentTintColor: UIColor
    let selectedSegmentColor: UIColor
    let normalSegmentColor: UIColor
}

public extension TunerViewStyle {
    static func defaultStyle() -> Self {
        Self(
            layout: .init(
                titleInsets: EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
            ),
            backgroundColor: .black,
            titleFont: Font.lato(
                .bold,
                size: 24
            ),
            titleColor: .white,
            segmentControlFont: Font.lato(.regular, size: 16),
            selectedSegmentTintColor: .white,
            selectedSegmentColor: .black,
            normalSegmentColor: .white
        )
    }
}
