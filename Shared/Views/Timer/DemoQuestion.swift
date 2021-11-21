//
//  DemoQuestion.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 21/11/21.
//

import SwiftUI
import Kingfisher

struct DemoQuestion: View {
    var hintAction: () -> Void = {}
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showPopuop: Bool = false
    var question : Question.Response =  Question.Response(question: Question.Model(text: "Q) Where lived the man? Et tu, Brute? rfs gjmnsi gqzj yttym", media: "https://media.istockphoto.com/vectors/high-five-illustration-vector-id990825882?k=20&m=990825882&s=612x612&w=0&h=A2y1eclB5SMJi5tdSBLq3uk6S2rHZnNUZt-qS-tq7xQ="))
    @State var answerStatus: AnswerStatus = .none
    @State var fetchedHint: String = ""
    @State var answerText: String = ""
    var answer = "this is answer"
    let hint = "This is the hint"
    var body: some View {
        ZStack {
            VStack(alignment:.leading,spacing: 0) {
                EnigmaHeader(showBackButton: true,showInstructionsButton: false,backAction: back)
                
                ScrollView(showsIndicators:false) {
                VStack(alignment:.leading,spacing: 20) {
                CustomLabel(text: "Demo Question", font: .Cinzel(size: 26, weight: .bold))
                        .padding(.bottom,20)
                Text(question.question?.text ?? "")
                    .font(.Mulish(size: 17))
                    .foregroundColor(Color.eGold)
                
                KFImage(question.question?.mediaURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                
                HStack {
                    TextField("Your Answer", text: $answerText)
                        .autocapitalization(.none)
                        .accentColor(.eGold)
                        .padding()
                        .foregroundColor(.eGold)
                        .background(Color(white: 1, opacity: 0.05))
                    
                    Button(action: showHint) {
                        Image(ImageConstants.hint)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    .foregroundColor(.black)
                    
                }.padding(.vertical)
                
                
                if(answerStatus == .wrong) {
                    Text("*Oops! Wrong answer. Try again")
                        .foregroundColor(.red)
                        .padding(.bottom)
                }
                
                
                if(fetchedHint != "") {
                        Text("Hint : \(fetchedHint)")
                            .font(.Mulish(size: 16, weight: .bold))
                            .foregroundColor(Color.eBlue)
                }
                
                CustomButton(buttonText: "Submit", action: submitAnswer, bgroundColor: .eGold)
                    .padding(.vertical)
                Spacer()
            }
            .padding(24)
                }
            }
        }
        .popup(isPresented: $showPopuop, animation: Animation.spring(), closeOnTap: false) {
            EnigmaAlert(title: "Wohoo!\n You got the right answer!",text: "You've earned a key!", showCloseButton: true, closeAction: back)
        }
        .background(Color.eBlack.edgesIgnoringSafeArea(.bottom))
        .navigationBarHidden(true)
    }
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func submitAnswer() {
        
    }
    
    func showHint() {
        self.fetchedHint = hint
    }
}


struct DemoQuestion_Previews: PreviewProvider {
    static var previews: some View {
        DemoQuestion()
    }
}
