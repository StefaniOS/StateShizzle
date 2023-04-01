//
//  ContentView.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct ContentView: View {

    @State private var isPresented: Bool = false

    private var playerState: XYPlayer.State = .init()

    var body: some View {
        PlayerControlView(viewModel: .init(playerState: playerState, shouldShowSlider: false, tintColorName: .deepGreen))
        PlayerControlView(viewModel: .init(playerState: playerState, shouldShowSlider: false, tintColorName: .orangeRed))
    }
}

////            .sheet(isPresented: $isPresented) {
////                VStack {
////                    NavigationBar(isPresented: $isPresented)
////                        .padding(.top, 32)
////                    Spacer()
////                    PlayerControlView(viewModel: .init(playerState: playerState))
////                    Spacer()
////                }
////            }
//    }
//}
//
//extension ContentView {
//
//    private var content: some View {
//        VStack(spacing: 20) {
//            PlayerControlView(viewModel: .init(playerState: playerState, shouldShowSlider: false, tintColorName: .orangeRed))
//                .padding(.top, 24)
////            Spacer()
////            ActionTriggerView(title: "PlayerControl 1", backgroundColor: .deepGreen,  action: $isPresented)
////            ActionTriggerView(title: "PlayerControl 2", backgroundColor: .deepPurple, action: $isPresented)
////            Spacer()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
