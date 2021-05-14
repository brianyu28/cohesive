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

    init() {
        self.csv = CSV(content: "")
    }

    static var readableContentTypes: [UTType] { [.csvDocument] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        csv = CSV(content: string)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let textContent = csv.toString().data(using: .utf8)!
        return .init(regularFileWithContents: textContent)
    }
}
