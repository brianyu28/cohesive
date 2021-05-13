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
                HStack {
                    ForEach(row, id: \.self) { field in
                        Text(field)
                    }
                }
            }
        }
    }
}

struct CSVTable_Previews: PreviewProvider {
    static var previews: some View {
        CSVTable(csv: .constant(CSV(content: "")))
    }
}
