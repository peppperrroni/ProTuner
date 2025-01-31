//
//  ContentView.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/24/25.
//

import SwiftUI

struct TunerView<ViewModel: TunerViewModelProtocol>: View {
    
    private let style: TunerViewStyle
    
    init(
        style: TunerViewStyle,
        viewModel: ViewModel
    ) {
        self.style = style
        self.viewModel = viewModel
        let appearance = UISegmentedControl.appearance()
        appearance.selectedSegmentTintColor = self.style.selectedSegmentTintColor
        appearance.setTitleTextAttributes(
            [.foregroundColor: self.style.selectedSegmentColor],
            for: .selected
        )
        appearance.setTitleTextAttributes(
            [.foregroundColor: self.style.normalSegmentColor],
            for: .normal
        )
    }
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(self.viewModel.currentMode.rawValue)
                .font(self.style.titleFont)
                .foregroundColor(self.style.titleColor)
                .padding(self.style.layout.titleInsets)
            Picker("Mode", selection: self.$viewModel.currentMode) {
                ForEach(Mode.allCases) { mode in
                    Text(mode.rawValue).tag(mode)
                        .font(self.style.segmentControlFont)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            tunerView()
                .padding()
            Spacer()
        }.onAppear {
            self.viewModel.start()
        }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.viewModel.start()
        }
        .alert(
            self.viewModel.alertData.title,
            isPresented: self.$viewModel.alertData.isPresented
        ) {
            alertButton(
                action: self.viewModel.alertData.primaryButtonAction,
                label: self.viewModel.alertData.primaryButtonTitle
            )
            alertButton(
                action: self.viewModel.alertData.secondaryButtonAction,
                label: self.viewModel.alertData.secondaryButtonTitle
            )
        } message: {
            Text(self.viewModel.alertData.subtitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(self.style.backgroundColor)
    }
    
    private func alertButton(action: (() -> Void)?, label: String) -> some View {
        if action == nil {
            return Button(label, role: .cancel) { }
        } else {
            return Button(label) { action?() }
        }
    }
    @ViewBuilder
    private func tunerView() -> some View {
        switch self.viewModel.currentMode {
        case .auto:
            AutoTunerView()
        case .manual:
            ManualTunerView()
        }
    }
}

#Preview {
    TunerView(style: .defaultStyle(), viewModel: TunerViewModel())
}
