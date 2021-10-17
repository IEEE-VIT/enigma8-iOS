//
//  DropdownView.swift
//  testing
//
//  Created by Ananya George on 10/12/21.
//

import SwiftUI

struct DropdownView: View {
//    var dropdownText: String
    @State private var isExpanded = false
    @State var selectedOption: String
    var dropdownOptions: [String]
    var body: some View {
        DisclosureGroup(selectedOption, isExpanded: $isExpanded) {
            VStack(alignment: .leading) {
                ForEach(dropdownOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                            .onTapGesture {
                                self.selectedOption = option
                                withAnimation {
                                    self.isExpanded.toggle()
                                }
                        }
                        Spacer()
                    }
                }
            }
        }
        .foregroundColor(Color.black)
        .font(.body)
        .accentColor(Color.black)
        .padding()
        .background(Color.gray)
        .cornerRadius(8)
//        .padding()
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView(selectedOption: "Friends", dropdownOptions: ["Friends","Social media", "Other"])
    }
}
