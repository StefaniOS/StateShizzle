//
//  NavigationBar.swift
//  StateShizzle
//
//  Created by Stepan Vardanyan on 01.04.23.
//

import SwiftUI

struct NavigationBar: View {

    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Text("SwiftUI Controls")
                .fontWeight(.bold)
                .foregroundColor(.purple)

            HStack {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .tint(.purple)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}
