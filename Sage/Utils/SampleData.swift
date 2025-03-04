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

    static let queryResults: [Word] =
        [
            Word(
                word: "run",
                pronounciation: "rʌn",
                definition: "to move swiftly on foot",
                synonyms: ["sprint", "jog"],
                antonyms: ["walk", "stand"],
                sentences: [
                    "noun": ["He went for a morning run in the park."],
                    "verb": ["She can run faster than anyone in her class."],
                    "adjective": ["The broken faucet has a run problem."],
                ]),

            Word(
                word: "light",
                pronounciation: "laɪt",
                definition: "something that makes things visible",
                synonyms: ["illumination", "glow"],
                antonyms: ["darkness", "shadow"],
                sentences: [
                    "noun": [
                        "The light from the candle flickered in the wind."
                    ],
                    "verb": ["Can you light the candle, please?"],
                    "adjective": ["She carried a light bag to the market."],
                ]),

            Word(
                word: "cold",
                pronounciation: "koʊld",
                definition: "having a low temperature",
                synonyms: ["chilly", "freezing"],
                antonyms: ["hot", "warm"],
                sentences: [
                    "noun": ["She caught a terrible cold last winter."],
                    "verb": [
                        "The wind will cold the room if we leave the windows open."
                    ],
                    "adjective": ["The weather is extremely cold today."],
                ]),

            Word(
                word: "break",
                pronounciation: "breɪk",
                definition: "to separate into pieces",
                synonyms: ["shatter", "crack"],
                antonyms: ["fix", "mend"],
                sentences: [
                    "noun": [
                        "Let's take a short break before continuing our work."
                    ],
                    "verb": ["Be careful not to break the glass."],
                    "adjective": [
                        "She had a break moment when she realized the truth."
                    ],
                ]),

            Word(
                word: "play",
                pronounciation: "pleɪ",
                definition: "to engage in an activity for enjoyment",
                synonyms: ["perform", "act"],
                antonyms: ["work", "labor"],
                sentences: [
                    "noun": ["The school organized a play for the students."],
                    "verb": ["The kids love to play outside."],
                    "adjective": [
                        "The play area was filled with laughter and joy."
                    ],
                ]),

            Word(
                word: "fast",
                pronounciation: "fæst",
                definition: "moving quickly",
                synonyms: ["quick", "speedy"],
                antonyms: ["slow", "delayed"],
                sentences: [
                    "noun": ["During Ramadan, many people observe a fast."],
                    "verb": ["He decided to fast for the entire day."],
                    "adjective": ["She is a fast runner."],
                ]),

            Word(
                word: "hard",
                pronounciation: "hɑrd",
                definition: "firm, solid, or difficult",
                synonyms: ["difficult", "tough"],
                antonyms: ["easy", "soft"],
                sentences: [
                    "noun": [
                        "The hard of the problem was understanding the question."
                    ],
                    "verb": ["He will hard his resolve to complete the task."],
                    "adjective": ["This test is very hard."],
                ]),

            Word(
                word: "cool",
                pronounciation: "kuːl",
                definition: "of a low temperature, or stylish",
                synonyms: ["chilly", "trendy"],
                antonyms: ["hot", "unfashionable"],
                sentences: [
                    "noun": ["The cool of the evening was refreshing."],
                    "verb": ["Let the soup cool before you eat it."],
                    "adjective": ["His jacket looks really cool."],
                ]),

            Word(
                word: "right",
                pronounciation: "raɪt",
                definition: "correct or a direction",
                synonyms: ["correct", "just"],
                antonyms: ["wrong", "left"],
                sentences: [
                    "noun": ["Everyone has the right to freedom of speech."],
                    "verb": ["She will right the mistakes in her report."],
                    "adjective": ["That is the right answer."],
                ]),

            Word(
                word: "warm",
                pronounciation: "wɔrm",
                definition: "moderately high temperature or friendly",
                synonyms: ["hot", "cozy"],
                antonyms: ["cold", "chilly"],
                sentences: [
                    "noun": ["The warm of the fire kept us comfortable."],
                    "verb": ["She will warm the soup before serving."],
                    "adjective": ["The blanket feels warm."],
                ]),
        ]

    static let favorites: [Word] = Self.queryResults

    static let favorite: Word = Self.favorites.first!
}
