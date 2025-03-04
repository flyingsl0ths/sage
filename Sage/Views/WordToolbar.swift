//
//  WordToolBar.swift
//  Sage
//
//  Created by Gabriel Celis on 3/4/25.
//

import SwiftUI

struct WordToolbar: View {
    @Binding var toSentencesView: Bool
    @Binding var toWordView: Bool
    @Binding var showSearchSheet: Bool

    var body: some View {
        HStack(spacing: 24) {
            Button(action: { toSentencesView = true }) {
                Icon(iconName: "text.alignleft")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }

            Button(action: { toWordView = true }) {
                Icon(iconName: "book")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }

            Button(action: { showSearchSheet = true }) {
                Icon(iconName: "plus")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
    }
}

#Preview {
    WordToolbar(
        toSentencesView: .constant(false), toWordView: .constant(false),
        showSearchSheet: .constant(false))
}
