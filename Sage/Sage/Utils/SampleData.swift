//
//  SampleData.swift
//  Sage
//
//  Created by Gabriel Celis on 12/8/24.
//

struct SampleData {
    static let partsOfSpeech = [
        "NOUN",
        "VERB",
        "ADJECTIVE",
    ]

    static let queryResults: [Word] = [
        Word(
            word: "ephemeral",
            pronounciation: "ih-FEM-er-uhl",
            definition: "Lasting a very short time.",
            synonyms: ["transient", "fleeting", "momentary"]
        ),
        Word(
            word: "epicenter",
            pronounciation: "EP-uh-sen-ter",
            definition:
                "The point on the Earth's surface directly above the focus of an earthquake.",
            synonyms: ["focus", "nucleus", "core"]
        ),
        Word(
            word: "epitome",
            pronounciation: "ih-PIT-uh-mee",
            definition: "A perfect example of a quality or type.",
            synonyms: ["embodiment", "paragon", "essence"]
        ),
        Word(
            word: "epigraph",
            pronounciation: "EP-i-graf",
            definition:
                "A short quotation at the beginning of a book or chapter.",
            synonyms: ["inscription", "engraving", "motto"]
        ),
        Word(
            word: "epiphany",
            pronounciation: "ih-PIF-uh-nee",
            definition: "A sudden realization or insight.",
            synonyms: ["revelation", "insight", "realization"]
        ),
        Word(
            word: "epidermis",
            pronounciation: "ep-i-DUR-mis",
            definition: "The outer layer of skin.",
            synonyms: ["skin", "cuticle", "hide"]
        ),
        Word(
            word: "epitaph",
            pronounciation: "EP-i-taf",
            definition:
                "A phrase or statement written in memory of someone who has died, especially on a tombstone.",
            synonyms: ["inscription", "legend", "commemoration"]
        ),
        Word(
            word: "epistolary",
            pronounciation: "ih-PIS-tuh-ler-ee",
            definition: "Relating to the writing of letters.",
            synonyms: ["written", "correspondent", "lettered"]
        ),
        Word(
            word: "epoxide",
            pronounciation: "EP-ok-sahyd",
            definition: "A cyclic ether with a three-atom ring.",
            synonyms: ["oxirane", "ether", "epoxy"]
        ),
        Word(
            word: "epicurean",
            pronounciation: "ep-i-KYOOR-ee-uhn",
            definition:
                "Devoted to the pursuit of pleasure, especially in food and comfort.",
            synonyms: ["hedonistic", "luxurious", "sensual"]
        ),
    ]

    static let favorites: [Word] = Self.queryResults

    static let favorite: Word =
        Word(
            word: "Serendipity",
            pronounciation: "seh-ren-DIP-uh-tee",
            definition:
                "The occurrence of events by chance in a happy or beneficial way.",
            synonyms: [
                "fluke", "fortune", "luck", "coincidence", "happy accident",
            ],
            antonyms: [
                "Murphy's law",
                "perfect storm",
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
