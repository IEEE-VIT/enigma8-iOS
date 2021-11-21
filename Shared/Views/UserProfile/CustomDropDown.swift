//
//  CustomDropDown.swift
//  Enigma (iOS)
//
//  Created by Alok N on 21/11/21.
//

import SwiftUI

struct CustomDropDown: View {
    var width: CGFloat = UIScreen.main.bounds.width*0.9
    var height:CGFloat = 50
    @Binding var selectedOption: String
    @State var showOptions: Bool = false
    var options: [String] = ["Instagram", "Facebook", "Twitter", "Reddit"]
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading, spacing: 0){
                HStack {
                    Text(selectedOption)
                        .font(.Mulish(size: 20))
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {withAnimation {self.showOptions.toggle()}})
                .padding(.horizontal)
                .frame(height: height)
                if(showOptions) {
                        Rectangle().fill(Color.eGold).frame(height: 2)
                    ScrollView {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .padding()
                                .frame(width: width, height: height, alignment: .leading)
                                .background(self.selectedOption == option ? Color(hex: "#242424") : Color.clear)
                                .contentShape(Rectangle())
                                .onTapGesture(perform: {
                                    withAnimation {self.showOptions = false}
                                    self.selectedOption = option
                                })
                        }
                    }.frame(height: 160)
                    
                }
            }.frame(width: width, alignment: .leading)
            .foregroundColor(.white)
            .background(Color.black)
            .border(showOptions ? LinearGradient.gold : LinearGradient(colors: [Color.eGold, Color.eGold], startPoint: .top, endPoint: .bottom), width: 2)
            .animation(.default)
        }.frame(width: width, height: height)
    }
}

//struct CustomDropDown_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomDropDown(selectedOption: Binding<String>{get: {return ""}, set: {p in something = p}})
//    }
//}
