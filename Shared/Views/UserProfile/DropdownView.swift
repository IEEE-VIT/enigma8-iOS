//
//  DropdownView.swift
//  testing
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct DropdownView: View {
//    var dropdownText: String
    @State private var isExpanded = true
    @State var selectedOption: String
    var dropdownOptions: [String]
    
    @State var disclosureOption: String = "   -Select-"
    var body: some View {
        DisclosureGroup(disclosureOption, isExpanded: $isExpanded) {
            VStack(alignment: .leading,spacing:0) {
                ForEach(dropdownOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(Font.Mulish(size: 12, weight: .regular))
                            .padding()
                        Spacer()
                    }
                    .frame(height: 36)
                    .background(self.selectedOption == option ? Color.egrey : Color.eBlack)
                    .onTapGesture {
                        self.selectedOption = option
                }
                }
            }
            .border(LinearGradient.gold,width:2)
        }
        .foregroundColor(Color.white)
        .padding(.top)
        .background(Color.eBlack)
        .border(LinearGradient.gold,width:2)
        .onChange(of: self.isExpanded) { expanded in
            if !expanded {
                self.disclosureOption = "   " + self.selectedOption
            }
        }
//        .padding()
        Spacer()
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView(selectedOption: "Friends", dropdownOptions: ["Friends","Social media", "Other"])
    }
}
