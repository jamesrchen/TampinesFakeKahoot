//
//  ContentView.swift
//  TampinesFakeKahoot
//
//  Created by James Chen on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    
    var colors = [Color.green, Color.red, Color.blue, Color.yellow]
    
    var questions = [
        Question(title: "YJ", answers: ["Soon", "Now", "Later", "Never"], correctIndex: 0),
        Question(title: "Swift?", answers: ["Yes", "No", "Java", "Eugene"], correctIndex: 3),
    ]
    
    @State var currentQuestion = 0
    @State var isAlertPresented = false
    
    @State var isCorrect = false
    
    @State var correctAnswers = 0
    @State var isModalPresented = false

    var body: some View {
        
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                withAnimation {
                    Text(questions[currentQuestion].title)
                        .font(.system(size: 50))
                        .bold()
                        .padding()
                }
                
                HStack {
                    
                    let question = questions[currentQuestion]
                    let answers = question.answers
                    
                    VStack {
                        ForEach(0..<2, id: \.self) { answerIndex in
                            Button(action: {
                                didTapOption(correct: answerIndex == question.correctIndex)
                            }, label: {
                                Text(answers[answerIndex])
                                    .foregroundColor(Color.white)
                            })
                            .padding()
                            .frame(width: 170, height: 50)
                            .background(colors[answerIndex])
                            .clipShape(Rectangle())
                        }
                    }.padding()
                    
                    VStack {
                        ForEach(2..<4, id: \.self) { answerIndex in
                            Button(action: {
                                didTapOption(correct: answerIndex == question.correctIndex)
                            }, label: {
                                Text(answers[answerIndex])
                                    .foregroundColor(Color.white)
                            })
                            .padding()
                            .frame(width: 170, height: 50)
                            .background(colors[answerIndex])
                            .clipShape(Rectangle())
                        }
                    }.padding()
                }
            }
            .alert(isPresented: $isAlertPresented, content: {
                Alert(title: Text(isCorrect ? "Correct" : "Gulag"),
                      message: Text(isCorrect ? "Smart" : "Labour camps"),
                      dismissButton: .default(Text("ok")){
                        currentQuestion += 1
                        if currentQuestion == questions.count {
                            isModalPresented = true
                            currentQuestion = 0
                        }
                      })
            })
            .sheet(isPresented: $isModalPresented,
                onDismiss: {
                    correctAnswers = 0
                },
                content: {
                    ScoreView(score: correctAnswers,
                              totalQuestions: questions.count)
                }
            )
        }
        
        
        
    }
    
    func didTapOption(correct: Bool) {
        if correct {
            isCorrect = true
            correctAnswers += 1
        } else {
            isCorrect = false
        }
        isAlertPresented = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
