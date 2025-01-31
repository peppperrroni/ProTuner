//
//  ContentView.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/31/25.
//

import SwiftUI

struct ContentView: View {
    private let styleProvider: ContentStyleProviderProtocol
    private let tunerViewModel: TunerViewModel
    private let navigationViewStyle: NavigationViewStyle
    
    init (
        styleProvider: ContentStyleProviderProtocol,
        tunerViewModel: TunerViewModel
    ) {
        self.styleProvider = styleProvider
        self.tunerViewModel = tunerViewModel
        self.navigationViewStyle = styleProvider.navigationViewStyle
    }
    
    var body: some View {
        NavigationView {
            TunerView(
                style: self.styleProvider.tunerViewStyle,
                viewModel: tunerViewModel
            ).navigationBarItems(
                trailing: Button(
                    action: {
                    }) {
                        self.navigationViewStyle.rightBarButtonImage
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: self.navigationViewStyle.rightBarButtonImageSize.width,
                                height: self.navigationViewStyle.rightBarButtonImageSize.height
                            )
                            .padding(self.navigationViewStyle.rightBarButtonInsets)
                            .foregroundStyle(Color(self.navigationViewStyle.tintColor))
                    })
        }
        
    }
}

#Preview {
    ContentView(
        styleProvider: ContentStyleProvider(
            navigationViewStyle: .defaultStyle(),
            tunerViewStyle: .defaultStyle()
        ),
        tunerViewModel: TunerViewModel()
    )
}
