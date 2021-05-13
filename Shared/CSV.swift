//
//  CSVFile.swift
//  Cohesive
//
//  Structure for parsing and writing CSV files.
//  Follows RFC 4180
//
//  Created by Brian Yu on 5/12/21.
//

struct CSV {
    var data: [[String]]
    let delimiter : Character = ","
    
    // Constants
    private let quote : Character = "\""
    private let newline : Character = "\n"
    
    init(content: String) {
        
        // Initial data
        data = []
        
        // Current row and current element
        var row : [String] = []
        var field : String = ""
        var inQuotes : Bool = false
        var possibleQuoteEnd : Bool = false
        
        for c in content {
            
            // Check for end of quoted field
            if (inQuotes && possibleQuoteEnd) {
                possibleQuoteEnd = false
                
                // Double quote is escape sequence for quotation mark
                if (c == quote) {
                    field.append(quote)
                    continue
                } else {
                    inQuotes = false
                }
            }
            
            // Check for end of field
            if (c == delimiter && !inQuotes) {
                row.append(field)
                field = ""
            }

            // Check for end of row
            else if (c == newline && !inQuotes) {
                row.append(field)
                data.append(row)
                field = ""
                row = []
            }
            
            // Check for start or end of quoted field
            else if (c == quote) {
                if (inQuotes) {
                    possibleQuoteEnd = true
                } else {
                    inQuotes = true
                }
            }
            
            // Add character to the current field
            else {
                field.append(c)
            }
        }
    }
}
