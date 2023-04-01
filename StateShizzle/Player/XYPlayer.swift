//
//  XYPlayer.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import Foundation

protocol XYPlayerDelegate: AnyObject {
    func playerStateChanged(state: XYPlayer.State)
}

class XYPlayer {

    struct State {
        var isRunning: Bool = false
        var currentPosition: Float = .zero
    }

    weak var delegate: XYPlayerDelegate?

    private var position: Float = 0
    private var player: Timer?

    static let sharedInstance = XYPlayer()

    func start() {
        player = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            self?.position += 1
            if self?.position == 100 {
                self?.position = 0
            }
            self?.publishState()
        })
    }

    func stop() {
        player?.invalidate()
        player = nil
        publishState()
    }

    func seek(to position: Float) {
        self.position = position
        publishState()
    }

    private func publishState() {
        delegate?.playerStateChanged(state: State(isRunning: player != nil, currentPosition: position))
    }

    func togglePlayStop() {
        if player == nil {
            start()
        } else {
            stop()
        }
    }
}
