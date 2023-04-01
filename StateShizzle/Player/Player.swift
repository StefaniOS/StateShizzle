//
//  Player.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

protocol Player {
    func start()
    func stop()
    func togglePlayStop()
    func seek(to position: Float)
}

struct PlayerState {
    var isRunning: Bool = false
    var currentPosition: Float = .zero
}
