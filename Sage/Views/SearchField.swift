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
                .frame(maxWidth: .infinity)
                .foregroundColor(.inputFieldBg)
            if searchQuery.isEmpty {
                Text("Type something...")
                    .foregroundColor(.accentColor)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            TextField("", text: $searchQuery)
                .padding(.trailing, 18)
                .foregroundColor(.accentColor)
                .offset(x: 8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SearchField(searchQuery: .constant(""))
}
