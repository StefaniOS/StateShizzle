//
//  ActionTriggerView.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct ActionTriggerView: View {

    let title: String
    var foregroundColor: Color = .white
    var backgroundColor: Color = .accentColor

    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title2)
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: 220)
        }
        .background(backgroundColor)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
