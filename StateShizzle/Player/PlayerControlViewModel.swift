//
//  PlayerViewModel.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import Foundation

class PlayerControlViewModel: ObservableObject {

    @Published var playerState: XYPlayer.State

    let shouldShowSlider: Bool

    let tintColorName: ColorName

    init(playerState: XYPlayer.State,
         shouldShowSlider: Bool = true,
         tintColorName: ColorName = .accentColor
    ) {
        self.playerState = playerState
        self.shouldShowSlider = shouldShowSlider
        self.tintColorName = tintColorName
        XYPlayer.sharedInstance.delegate = self
    }

    private func update(state: XYPlayer.State) {
        playerState = state
    }
}

extension PlayerControlViewModel: XYPlayerDelegate {

    func playerStateChanged(state: XYPlayer.State) {
        update(state: state)
    }
}
