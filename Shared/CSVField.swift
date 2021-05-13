//
//  CSVField.swift
//  Cohesive
//
//  Created by Brian Yu on 5/13/21.
//

import SwiftUI

struct CSVField: View {
    
    var content: String
    
    var body: some View {
        Group {
            Text(content)
        }
        .font(.system(size: 14))
        .frame(width: 80)
        .lineLimit(1)
        .border(Color.black)
        .background(Color.white)
        
    }
}

struct CSVField_Previews: PreviewProvider {
    static var previews: some View {
        CSVField(content: "foo")
    }
}
