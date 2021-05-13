//
//  CohesiveDocument.swift
//  Shared
//
//  Created by Brian Yu on 5/11/21.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var csvDocument: UTType {
        UTType(importedAs: "public.comma-separated-values-text")
    }
}

struct CohesiveDocument: FileDocument {
    var csv : CSV
    var text: String

    init(text: String = "Hello, world!") {
        self.text = "this is a test"
        self.csv = CSV(content: "")
    }

    static var readableContentTypes: [UTType] { [.csvDocument] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
        csv = CSV(content: string)
        print(csv.data)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = "foo".data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
