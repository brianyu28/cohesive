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
            ForEach(csv.data, id: \.self) { row in
                CSVRow(row: row)
            }
        }
    }
}

struct CSVTable_Previews: PreviewProvider {
    static var previews: some View {
        CSVTable(csv: .constant(CSV(content: "a,b,c")))
    }
}
