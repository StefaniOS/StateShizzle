//
//  PlayerViewModel.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import Foundation

class PlayerControlViewModel: ObservableObject {

    let shouldShowSlider: Bool
    let tintColorName: ColorName

    init(shouldShowSlider: Bool = true,
         tintColorName: ColorName = .accentColor) {
        self.shouldShowSlider = shouldShowSlider
        self.tintColorName = tintColorName
    }

    func controlImageName(_ isRunning: Bool) -> String {
        isRunning ? "pause.circle.fill" : "play.circle.fill"
    }
}
