//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation
import XCTest
import AzureCommunicationCommon
@testable import AzureCommunicationUICalling

class PreviewAreaViewModelTests: XCTestCase {

  private var localizationProvider: LocalizationProviderMocking!
  private var storeFactory: StoreFactoryMocking!
  private var logger: LoggerMocking!
  private var factoryMocking: CompositeViewModelFactoryMocking!

    override func setUp() {
        super.setUp()
        localizationProvider = LocalizationProviderMocking()
        storeFactory = StoreFactoryMocking()
        logger = LoggerMocking()
        factoryMocking = CompositeViewModelFactoryMocking(logger: logger, store: storeFactory.store,
                                                          avatarManager: AvatarViewManagerMocking(store: storeFactory.store,
                                                                                                  localParticipantId: createCommunicationIdentifier(fromRawId: ""),
                                                                                                  localParticipantViewData: nil),
                                                          updatableOptionsManager: UpdatableOptionsManager(store: storeFactory.store, setupScreenOptions: nil, callScreenOptions: nil))
    }

    factoryMocking.localVideoViewModel = LocalVideoViewModelMocking(
      compositeViewModelFactory: factoryMocking,
      logger: logger,
      localizationProvider: localizationProvider,
      dispatchAction: storeFactory.store.dispatch,
      updateState: updateState)
    let visibilityState = VisibilityState(currentStatus: .visible)
    let sut = makeSUT()
    sut.update(
      localUserState: localUserState, permissionState: PermissionState(),
      visibilityState: visibilityState)
    wait(for: [expectation], timeout: 1.0)
  }

  func test_previewAreaViewModel_displays_previewAreaText_from_LocalizationMocking() {
    let cameraState = LocalUserState.CameraState(
      operation: .off,
      device: .front,
      transmission: .local)
    let appState = AppState(
      permissionState: PermissionState(
        audioPermission: .denied,
        cameraPermission: .notAsked),
      localUserState: LocalUserState(cameraState: cameraState))
    let visibilityState = VisibilityState(currentStatus: .visible)
    let sut = makeSUTLocalizationMocking()
    sut.update(
      localUserState: appState.localUserState, permissionState: appState.permissionState,
      visibilityState: visibilityState)

    let expectedIcon = CompositeIcon.micOff
    let expectedTextKey = "AzureCommunicationUICalling.SetupView.PreviewArea.AudioDisabled"

    XCTAssertTrue(sut.isPermissionsDenied)
    XCTAssertEqual(sut.getPermissionWarningIcon(), expectedIcon)
    XCTAssertEqual(sut.getPermissionWarningText(), expectedTextKey)
  }
}

extension PreviewAreaViewModelTests {
  func makeSUT(localizationProvider: LocalizationProviderMocking? = nil) -> PreviewAreaViewModel {
    return PreviewAreaViewModel(
      compositeViewModelFactory: factoryMocking,
      dispatchAction: storeFactory.store.dispatch,
      localizationProvider: localizationProvider ?? LocalizationProvider(logger: logger))
  }

  func makeSUTLocalizationMocking() -> PreviewAreaViewModel {
    return makeSUT(localizationProvider: localizationProvider)
  }
}
