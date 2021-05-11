//
//  ContentView.swift
//  Shared
//
//  Created by Brian Yu on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: CohesiveDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(CohesiveDocument()))
    }
}
