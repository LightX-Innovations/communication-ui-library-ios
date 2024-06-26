//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import SwiftUI

struct SetupControlBarView: View {
    @ObservedObject var viewModel: SetupControlBarViewModel
    @State var audioDeviceButtonSourceView = UIView()
    @AccessibilityFocusState var focusedOnAudioButton: Bool
    let layoutSpacing: CGFloat = 0
    let controlWidth: CGFloat = 315
    let controlHeight: CGFloat = 50
    let horizontalPadding: CGFloat = 16
    let verticalPadding: CGFloat = 13

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                HStack(alignment: .center, spacing: layoutSpacing) {
                    if viewModel.isCameraDisplayed {
                        Spacer()
                        cameraButton
                    }
                    Spacer()
                    micButton
                    Spacer()
                    audioDeviceButton
                    Spacer()
                }
                .frame(width: getWidth(from: geometry), height: controlHeight)
                .padding(.horizontal, getHorizontalPadding(from: geometry))
                .padding(.vertical, verticalPadding)
                .hidden(viewModel.isControlBarHidden())
                .accessibilityElement(children: .contain)
            }.accessibilityElement(children: .contain)
        }
        .modifier(PopupModalView(isPresented: viewModel.isAudioDeviceSelectionDisplayed) {
            audioDeviceSelectionListView
        })
    }
    var cameraButton: some View {
        IconWithLabelButton(viewModel: viewModel.cameraButtonViewModel)
            .accessibility(identifier: AccessibilityIdentifier.toggleVideoAccessibilityID.rawValue)
            .hidden(!viewModel.isCameraDisplayed)
    }

    var micButton: some View {
        IconWithLabelButton(viewModel: viewModel.micButtonViewModel)
            .accessibility(identifier: AccessibilityIdentifier.toggleMicAccessibilityID.rawValue)
    }

    var audioDeviceButton: some View {
        IconWithLabelButton(viewModel: viewModel.audioDeviceButtonViewModel)
            .background(SourceViewSpace(sourceView: audioDeviceButtonSourceView))
            .accessibility(identifier: AccessibilityIdentifier.toggleAudioDeviceAccessibilityID.rawValue)
            .accessibilityFocused($focusedOnAudioButton, equals: true)
    }

    var audioDeviceSelectionListView: some View {
        CompositeAudioDevicesList(isPresented: $viewModel.isAudioDeviceSelectionDisplayed,
                                  viewModel: viewModel.audioDevicesListViewModel,
                                  sourceView: audioDeviceButtonSourceView)
        .onDisappear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                focusedOnAudioButton = true
            }
        }
    }

    private func getWidth(from geometry: GeometryProxy) -> CGFloat {
        if controlWidth > geometry.size.width {
            return geometry.size.width
        }
        return controlWidth
    }

    private func getHorizontalPadding(from geometry: GeometryProxy) -> CGFloat {
        if controlWidth > geometry.size.width {
            return 0
        }
        return (geometry.size.width - controlWidth) / 2
    }
}
