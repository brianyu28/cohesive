//
//  CSVRow.swift
//  Cohesive
//
//  Created by Brian Yu on 5/13/21.
//

import SwiftUI

struct CSVRow: View {
    
    @Binding var row: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<row.count, id: \.self) { i in
                CSVField(content: $row[i])
            }
        }
    }
}

struct CSVRow_Previews: PreviewProvider {
    static var previews: some View {
        CSVRow(row: .constant(["a", "b", "c"]))
    }
}
