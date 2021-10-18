//
//  RadioButtonGroup.swift
//  testing
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct RadioButtonGroup: View {
    var titleText: String = "Are you a college student?"
    var options: [String] = ["Yes", "No"]
    @Binding var selected: Int
    var numberOfOptions: Int {
        options.count
    }
    var body: some View {
        VStack {
            Text(titleText)
                .padding(.bottom)
            HStack {
                ForEach(0..<numberOfOptions) { index in
                    HStack {
                        Image(systemName: selected == index ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(Color.gray)
                        Text(options[index])
                    }
                    .onTapGesture {
                        selected = index
                        }
                    
                }
            }
        
            
            
        }
        
    }
}

struct RadioButtonGroup_Previews: PreviewProvider {
    static var selectedInt = 0
    static var previews: some View {
        RadioButtonGroup(titleText: "Are you a college student?", options: ["Yes", "No"], selected: .constant(selectedInt))
    }
}
