//
//  ContentStyleProvider.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/31/25.
//


public protocol ContentStyleProviderProtocol {
    var navigationViewStyle: NavigationViewStyle { get }
    var tunerViewStyle: TunerViewStyle { get }
}

final class ContentStyleProvider: ContentStyleProviderProtocol {
    var navigationViewStyle: NavigationViewStyle
    var tunerViewStyle: TunerViewStyle
    
    init(
        navigationViewStyle: NavigationViewStyle,
        tunerViewStyle: TunerViewStyle
    ) {
        self.navigationViewStyle = navigationViewStyle
        self.tunerViewStyle = tunerViewStyle
    }
}
