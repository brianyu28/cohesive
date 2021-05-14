//
//  CSVTable.swift
//  Cohesive
//
//  Created by Brian Yu on 5/13/21.
//

import SwiftUI

struct CSVTable: View {
    
    @Binding var csv: CSV

    var body: some View {
        VStack {
            ForEach(0..<csv.data.count, id: \.self) { i in
                CSVRow(row: $csv.data[i])
            }
        }
    }
}

struct CSVTable_Previews: PreviewProvider {
    static var previews: some View {
        CSVTable(csv: .constant(CSV(content: "a,b,c")))
    }
}
