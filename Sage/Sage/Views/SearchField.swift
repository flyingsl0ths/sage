//
//  SearchField.swift
//  Sage
//
//  Created by Gabriel Celis on 9/17/24.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchQuery: String

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 44)
                .foregroundColor(.inputFieldBg)
            if searchQuery.isEmpty {
                Text("Type something...")
                    .foregroundColor(.accentColor)
                    .padding(2)
                    .offset(x: 8)
            }
            TextField("", text: $searchQuery)
                .padding(2)
                .foregroundColor(.accentColor)
                .offset(x: 8)
        }
    }
}

#Preview {
    SearchField(searchQuery: .constant(""))
}
