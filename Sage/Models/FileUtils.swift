//
//  FileUtils.swift
//  Sage
//
//  Created by Gabriel Celis on 4/28/25.
//

import SwiftUI

func writeData<T>(_ data: T, fileName: String) -> Bool
where T: Encodable {
    do {
        let fileURL = try FileManager.default
            .url(
                for: .documentDirectory, in: .userDomainMask,
                appropriateFor: nil, create: true
            )
            .appendingPathComponent(fileName)

        try JSONEncoder()
            .encode(data)
            .write(to: fileURL)

        return true
    } catch {
        return false

    }
}

func readData<T>(fileName: String) -> T?
where T: Decodable {
    do {
        let fileURL = try FileManager.default
            .url(
                for: .documentDirectory, in: .userDomainMask,
                appropriateFor: nil, create: false
            )
            .appendingPathComponent(fileName)

        let data = try Data(contentsOf: fileURL)

        let pastData = try JSONDecoder().decode(T.self, from: data)

        return pastData
    } catch {
        return nil
    }
}
