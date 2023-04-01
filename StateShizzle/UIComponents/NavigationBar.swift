//
//  NavigationBar.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct NavigationBar: View {

    var title: String
    var tintColor: Color = .accentColor

    var dismiss: () -> Void

    var body: some View {
        ZStack {
            VStack {
                Text("SwiftUI Controls")
                    .font(.title3)
                Text(title)
            }
            .fontWeight(.bold)
            .foregroundColor(tintColor)

            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .tint(tintColor)
                }

            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}
