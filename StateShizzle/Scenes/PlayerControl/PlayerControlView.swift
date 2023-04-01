//
//  PlayerView.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct PlayerControlView: View {

    @StateObject private  var viewModel: PlayerControlViewModel
    @EnvironmentObject private var player: ObservablePlayer

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
            value: $player.state.currentPosition,
            in: 0...99,
            onEditingChanged: { _  in
                player.seek(to: player.state.currentPosition)
            })
        .tint(tintColor)
        .padding()
    }

    var actionView: some View {
        Button(action: {
            if !player.state.isRunning {
                player.start()
            }
            else {
                player.stop()
            }
        }) {
            Image(systemName: viewModel.controlImageName(player.state.isRunning))
            .resizable()
            .frame(width: 76.0, height: 76.0)
            .tint(tintColor)
        }
    }

    var infoView: some View {
        Text("\(Int(player.state.currentPosition))")
            .font(.custom("DBLCDTempBlack", size: 48))
            .foregroundColor(tintColor)
            .padding()
    }
}
