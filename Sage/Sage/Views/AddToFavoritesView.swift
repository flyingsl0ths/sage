//
//  AddToFavoritesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/20/24.
//

import SwiftUI

struct AddToFavoritesView: View {
    @Binding var word: String

    @State private var results: [Query] = [
        Query(
            word: "ephemeral", pronounciation: "ih-FEM-er-uhl",
            definition: "Lasting a very short time."),
        Query(
            word: "epicenter", pronounciation: "EP-uh-sen-ter",
            definition:
                "The point on the Earth's surface directly above the focus of an earthquake."
        ),
        Query(
            word: "epitome", pronounciation: "ih-PIT-uh-mee",
            definition: "A perfect example of a quality or type."),
        Query(
            word: "epigraph", pronounciation: "EP-i-graf",
            definition:
                "A short quotation at the beginning of a book or chapter."),
        Query(
            word: "epiphany", pronounciation: "ih-PIF-uh-nee",
            definition: "A sudden realization or insight."),
        Query(
            word: "epidermis", pronounciation: "ep-i-DUR-mis",
            definition: "The outer layer of skin."),
        Query(
            word: "epitaph", pronounciation: "EP-i-taf",
            definition:
                "A phrase or statement written in memory of someone who has died, especially on a tombstone."
        ),
        Query(
            word: "epistolary", pronounciation: "ih-PIS-tuh-ler-ee",
            definition: "Relating to the writing of letters."),
        Query(
            word: "epoxide", pronounciation: "EP-ok-sahyd",
            definition: "A cyclic ether with a three-atom ring."),
        Query(
            word: "epicurean", pronounciation: "ep-i-KYOOR-ee-uhn",
            definition:
                "Devoted to the pursuit of pleasure, especially in food and comfort."
        ),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {

            SearchBar(searchQuery: $word)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(results, id: \.word.hash) { result in
                        FavoritesQueryItem(
                            word: result.word,
                            pronounciation: result.pronounciation,
                            definition: result.definition
                        )
                        .padding(
                            EdgeInsets(
                                top: 0, leading: 0, bottom: 0, trailing: 20))
                    }
                }
                .padding(
                    EdgeInsets(top: 0, leading: 36, bottom: 0, trailing: 0))
            }
        }
    }
}

#Preview {
    AddToFavoritesView(word: .constant("ep"))
}
