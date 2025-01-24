//
//  ContentView.swift
//  ProTuner
//
//  Created by Yuriy Egorov on 1/24/25.
//

import SwiftUI

struct TunerView<ViewModel: TunerViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
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
        .padding()
    }
    
    private func alertButton(action: (() -> Void)?, label: String) -> some View {
        if action == nil {
            return Button(label, role: .cancel) { }
        } else {
            return Button(label) { action?() }
        }
    }
}

#Preview {
    TunerView(viewModel: TunerViewModel())
}
