//
//  SampleData.swift
//  Sage
//
//  Created by Gabriel Celis on 12/8/24.
//

struct SampleData {
    static let queryResults: [Query] = [
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

    static let favorites: [Favorite] = [
        Favorite(
            query: Query(
                word: "Ephemeral",
                pronounciation:
                    "ih-FEM-er-uhl",
                definition:
                    "Lasting for a very short time"
            ),
            synonyms: [
                "fleeting", "transient",
                "short-lived",
            ]
        ),
        Favorite(
            query: Query(
                word: "Ineffable",
                pronounciation:
                    "in-EF-uh-buhl",
                definition:
                    "Too great or extreme to be expressed in words"
            ),
            synonyms: [
                "indescribable",
                "unspeakable",
                "inexpressible",
            ]
        ),
        Favorite(
            query: Query(
                word: "Serendipity",
                pronounciation:
                    "seh-ren-DIP-ih-tee",
                definition:
                    "The occurrence of events by chance in a happy or beneficial way"
            ),
            synonyms: [
                "fluke", "luck",
                "coincidence",
            ]
        ),
        Favorite(
            query: Query(
                word: "Ebullient",
                pronounciation:
                    "ih-BUHL-yuhnt",
                definition:
                    "Full of energy, enthusiasm, and cheerfulness"
            ),
            synonyms: [
                "exuberant", "elated",
                "vivacious",
            ]
        ),
        Favorite(
            query: Query(
                word: "Luminous",
                pronounciation:
                    "LOO-muh-nuhs",
                definition:
                    "Full of or shedding light; bright or shining, especially in the dark"
            ),
            synonyms: [
                "radiant", "brilliant",
                "shining",
            ]
        ),
    ]

    static let favorite: Favorite = Favorite(
        query: Query(
            word: "Serendipity",
            pronounciation: "seh-ren-DIP-uh-tee",
            definition:
                "The occurrence of events by chance in a happy or beneficial way."
        ),
        synonyms: [
            "fluke", "fortune", "luck", "coincidence", "happy accident",
        ]
    )

    static let baseSentences: [String] = [
        "Hedonism promotes the pursuit of pleasure as the highest good.",
        "Many philosophers debate the merits of hedonism in ethical discussions.",
        "Hedonism often emphasizes the importance of immediate gratification.",
        "Some people view hedonism as a lifestyle choice that prioritizes enjoyment.",
        "Critics argue that hedonism can lead to a superficial understanding of happiness.",
    ]
}
