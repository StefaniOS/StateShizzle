//
//  Player.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import Foundation

class ObservablePlayer: ObservableObject {

    @Published var state: PlayerState = .init()

    private var position: Float = 0

    private var player: Timer?
}

extension ObservablePlayer: Player {

    func start() {
        guard player == nil else { return }
        player = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.position += 1
            if self?.position == 100 {
                self?.position = 0
            }
            self?.updateState()
        }
    }

    func stop() {
        guard player != nil else { return }
        player?.invalidate()
        player = nil
        updateState()
    }

    func seek(to position: Float) {
        self.position = position
        updateState()
    }

    func togglePlayStop() {
        if player == nil {
            start()
        } else {
            stop()
        }
    }

    private func updateState() {
        state.isRunning = player != nil
        state.currentPosition = position
    }
}
