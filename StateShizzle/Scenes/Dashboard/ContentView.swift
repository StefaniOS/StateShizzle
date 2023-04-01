//
//  ContentView.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var observablePlayer: ObservablePlayer = .init()

    @State private var presentedSheet: Sheet?

    var body: some View {
        content
            .sheet(item: $presentedSheet) { sheet in
                VStack {
                    NavigationBar(title: sheet.title, tintColor: sheet.tintColor) {
                        presentedSheet = nil
                    }
                    .padding(.top, 32)
                    Spacer()
                    PlayerControlView(viewModel: .init(tintColorName: sheet.tintColor.name))
                    Spacer()
                }
            }
            .environmentObject(observablePlayer)
    }
}

extension ContentView {

    private enum Sheet: String, Identifiable {
        case player1, player2

        var id: String { rawValue }

        var title: String {
            switch self {
            case .player1:
                return "Player 1"
            case .player2:
                return "Player 2"
            }
        }

        var tintColor: Color {
            switch self {
            case .player1:
                return .deepGreen
            case .player2:
                return .deepPurple
            }
        }
    }

    private var content: some View {
        VStack(spacing: 20) {
            PlayerControlView(viewModel: .init(shouldShowSlider: false, tintColorName: .orangeRed))
                .padding(.top, 24)
            Spacer()
            ActionTriggerView(title: "Player 1", backgroundColor: Sheet.player1.tintColor) {
                presentedSheet = .player1
            }
            ActionTriggerView(title: "Player 2", backgroundColor: Sheet.player2.tintColor) {
                presentedSheet = .player2
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
