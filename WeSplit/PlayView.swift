//
//  ContentView.swift
//  WeSplit
//
//  Created by Phil Mui on 1/29/21.
//

import SwiftUI

struct PlayView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
            .opacity(1.0)
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
