//
//  ContentView.swift
//  MoreOrLessApp
//
//  Created by Matthieu Guillemin on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var nbAttempts = 0
    let nbAttemptsMax = 10
    
    @State var lost = false
    @State var won = false
    
    @State var response = Int.random(in: 1...100)
    
    @State var attempt = ""
    @State var comment = ""
    
    @State var selectedLanguage: String = "Français" // Default language
    
    // Dictionary to store translations for both languages
    let translations: [String: [String: String]] = [
        "Français": [
            "greeting": "Hello Master CIM !!!",
            "subtitle": "TP 2 M. Guillemin",
            "gameTitle": "PLUS OU MOINS",
            "attemptsRemaining": "Nombre de tentatives restantes",
            "tryYourLuck": "Tentez votre chance...",
            "play": "Jouer",
            "replay": "Rejouer",
            "tooHigh": "trop grand...",
            "tooLow": "trop petit...",
            "numericValue": "Entrez une valeur numérique SVP",
            "gameOver": "Game over ! Vous avez utilisé vos 10 tentatives :("
        ],
        "Perse": [
            "greeting": "سلام استاد CIM !!!",
            "subtitle": "TP 2 M. Guillemin",
            "gameTitle": "بیشتر یا کمتر",
            "attemptsRemaining": "تعداد تلاش‌های باقی‌مانده",
            "tryYourLuck": "شانست رو امتحان کن...",
            "play": "بازی",
            "replay": "دوباره بازی کن",
            "tooHigh": "خیلی بزرگه...",
            "tooLow": "خیلی کوچیکه...",
            "numericValue": "لطفاً یک مقدار عددی وارد کنید",
            "gameOver": "بازی تمام شد! شما از 10 تلاش خود استفاده کردید :("
        ]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Language selection
            Picker("Langue", selection: $selectedLanguage) {
                Text("Français").tag("Français")
                Text("Perse").tag("Perse")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedLanguage) { newLanguage in
                resetGame()
                comment = ""
            }
            
            VStack(alignment: .center) {
                Text(translations[selectedLanguage]!["greeting"]!)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding()
                Text(translations[selectedLanguage]!["subtitle"]!)
                    .italic()
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 150,
                    alignment: .center
            )
             .background(Color(.sRGB, white: 0.95, opacity: 1.0))
            
            Divider()
                .frame(height: 15)
                .background(.blue)
            
            VStack(alignment: .center) {
                
                Text(translations[selectedLanguage]!["gameTitle"]!)
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                ProgressView(
                    value: Double(nbAttempts),
                    total: Double(nbAttemptsMax)
                )
                
                Text("\(translations[selectedLanguage]!["attemptsRemaining"]!): \(nbAttemptsMax - nbAttempts)")
                
                Spacer()
                
                TextField(translations[selectedLanguage]!["tryYourLuck"]!, text: $attempt)
                    .padding()
                    .frame(maxWidth: 300,
                           alignment: .center
                    )
                    .background(Color(.sRGB, white: 0.95, opacity: 1.0))
                    .foregroundColor(.blue)
                
                
                Button(translations[selectedLanguage]!["play"]!) {
                    if nbAttempts < nbAttemptsMax {
                        if let attemptInt = Int(attempt) {
                            if attemptInt == response {
                                comment = generateComment(attempts: nbAttempts, language: selectedLanguage)
                                won = true
                            } else if attemptInt > response {
                                comment = "\(attemptInt) \(translations[selectedLanguage]!["tooHigh"]!)"
                                nbAttempts += 1
                            } else {
                                comment = "\(attemptInt) \(translations[selectedLanguage]!["tooLow"]!)"
                                nbAttempts += 1
                            }
                        } else {
                            comment = translations[selectedLanguage]!["numericValue"]!
                        }
                        attempt = ""
                    } else {
                        lost = true
                        comment = translations[selectedLanguage]!["gameOver"]!
                    }
                }
                .padding()
                .frame(maxWidth: 300)
                .foregroundColor(.white)
                .disabled(lost || won)
                .background(
                    won || lost ? Color.gray :
                    Color.blue
                )
                
                Button(translations[selectedLanguage]!["replay"]!) {
                    resetGame()
                }
                .padding()
                .frame(maxWidth: 300,
                       alignment: .center
                )
                .foregroundColor(.white)
                .disabled(!(lost || won))
                .background(
                    won || lost ? Color.blue :
                    Color.gray
                )
                
                Spacer()
                
                VStack {
                    Text(comment)
                        .padding()
                        .frame(alignment: .center)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                .background(
                    won ? Color.green :
                    lost ? Color.red :
                    Color.blue
                )
                .edgesIgnoringSafeArea(.all)

            }
            
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top)
    }
    
    func resetGame() {
        comment = ""
        nbAttempts = 0
        lost = false
        won = false
        response = Int.random(in: 1...100)
    }
}

#Preview {
    ContentView()
}



/*
import SwiftUI

struct ContentView: View {
    
    @State var nbAttempts = 0
    let nbAttemptsMax = 10
    
    @State var lost = false
    @State var won = false
    
    @State var response = Int.random(in: 1...100)
    
    @State var attempt = ""
    @State var comment = ""
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(alignment: .center) {
                Text("Hello Master CIM !!!")
                    .font(.system(size: 25))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Text(String(response)) // "TP 2 M. Guillemin"
                    .italic()
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 150,
                    alignment: .center
            )
             .background(Color(.sRGB, white: 0.95, opacity: 1.0))
            
            Divider()
                .frame(height: 15)
                .background(.blue)
            
            VStack(alignment: .center) {
                
                Text("MORE OR LESS")
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                
                Spacer()
                
                ProgressView(
                    value: Double(nbAttempts),
                    total: Double(nbAttemptsMax)
                )
                
                Text("Nombre de tentatives restantes : \(nbAttemptsMax - nbAttempts)")
                
                Spacer()
                
                TextField("Tentez votre chance...", text: $attempt)
                    .padding()
                    .frame(maxWidth: 300,
                           alignment: .center
                    )
                    .background(Color(.sRGB, white: 0.95, opacity: 1.0))
                    .foregroundColor(.blue)
                
                
                Button("Jouer") {
                    if nbAttempts < nbAttemptsMax {
                        nbAttempts += 1
                        if let attemptInt = Int(attempt) {
                            if attemptInt == response {
                                comment = generateComment(attempts: nbAttempts)
                                won = true
                            } else if attemptInt > response {
                                comment = "Indication : \(attemptInt) trop grand..."
                            } else {
                                comment = "Indication : \(attemptInt) trop petit..."
                            }
                        } else {
                            comment = "Entrez une valeur numérique SVP"
                        }
                        attempt = ""
                    } else {
                        lost = true
                        comment = "Game over ! Vous avez utilisé vos 10 tentatives :("
                    }
                }
                .padding()
                .frame(maxWidth: 300,
                       alignment: .center
                )
                .foregroundColor(.white)
                .disabled(lost || won)
                .background(
                    won || lost ? Color.gray :
                    Color.blue
                )
                
                Button("Rejouer") {
                    comment = ""
                    nbAttempts = 0
                    lost = false
                    won = false
                    response = Int.random(in: 1...100)
                }
                .padding()
                .frame(maxWidth: 300,
                       alignment: .center
                )
                .foregroundColor(.white)
                .disabled(!(lost || won))
                .background(
                    won || lost ? Color.blue :
                    Color.gray
                )
                
                Spacer()
                
                VStack {
                    Text(comment)
                        .padding()
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                .background(
                    won ? Color.green :
                    lost ? Color.red :
                    Color.blue
                )
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            }
            
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .top)
    }
}

#Preview {
    ContentView()
}
 */
