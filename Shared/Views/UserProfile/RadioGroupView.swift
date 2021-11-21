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
        VStack(alignment:.leading,spacing:8) {
            Text(titleText)
                .font(.Mulish(size: 16, weight: .regular))
                .foregroundColor(.eGold)

            HStack {
                ForEach(0..<numberOfOptions) { index in
                    HStack {
                        Image(systemName: selected == index ? "largecircle.fill.circle" : "circle")
                        Text(options[index])
                            .font(.Mulish(size: 16, weight: .regular))
                    }
                    .foregroundColor(Color.eBlue)
                    .onTapGesture {
                        withAnimation {
                            selected = index
                        }
                        }
                    .padding(.leading)
                    
                }
            }
        
            
            
        }
        
    }
}

struct RadioButtonGroup_Previews: PreviewProvider {
    static var selectedInt = 0
    static var previews: some View {
        RadioButtonGroup(titleText: "Q2. On a scale of 1-5, how would you rate the game?", options: ["1","2","3","4","5"], selected: .constant(selectedInt))
    }
}
