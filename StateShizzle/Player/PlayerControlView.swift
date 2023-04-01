//
//  PlayerView.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct PlayerControlView: View {

    @StateObject private  var viewModel: PlayerControlViewModel

    private let tintColor: Color

    init(viewModel: PlayerControlViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        tintColor = .init(viewModel.tintColorName)
    }

    var body: some View {
        content
    }
}

extension PlayerControlView {

    var content: some View {
        VStack {
            if viewModel.shouldShowSlider {
                sliderView
            }
            actionView
            infoView
        }
    }

    var sliderView: some View {
        Slider(
            value: $viewModel.playerState.currentPosition,
            in: 0...99,
            onEditingChanged: { _  in
                XYPlayer.sharedInstance.seek(to: viewModel.playerState.currentPosition)
            })
        .tint(tintColor)
        .padding()
    }

    var actionView: some View {
        Button(action: {
            if viewModel.playerState.isRunning != true {
                XYPlayer.sharedInstance.start()
            }
            else {
                XYPlayer.sharedInstance.stop()
            }
        }) {
            Image(systemName: viewModel.playerState.isRunning == true ?
                  "pause.circle.fill" : "play.circle.fill")
            .resizable()
            .frame(width: 76.0, height: 76.0)
            .tint(tintColor)
        }
    }

    var infoView: some View {
        Text("\(Int(viewModel.playerState.currentPosition))")
            .font(.custom("DBLCDTempBlack", size: 48))
            .foregroundColor(tintColor)
            .padding()
    }
}
