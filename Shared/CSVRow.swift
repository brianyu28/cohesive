//
//  CSVRow.swift
//  Cohesive
//
//  Created by Brian Yu on 5/13/21.
//

import SwiftUI

struct CSVRow: View {
    
    var row: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(row, id: \.self) { field in
                CSVField(content: field)
            }
        }
    }
}

struct CSVRow_Previews: PreviewProvider {
    static var previews: some View {
        CSVRow(row: ["a", "b", "c"])
    }
}
