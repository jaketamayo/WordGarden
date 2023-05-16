//
//  ContentView.swift
//  WordGarden
//
//  Created by Jacob Tamayo on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var wordToGuess = 0
    @State private var wordsGuessed = 0
    @State private var wordsMissed = 0
    @State private var wordsInGame = 0
    @State private var howManyGuesses = "How many words are in this guess"
    @State private var guessedLetter = ""
    @State private var anotherGuess = true
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("Words Missed: \(wordsMissed) ")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Words to Guess: \(wordToGuess)")
                    Text("Words in Game: \(wordsInGame)")
                }
            }
            .padding()
            
            Spacer()
            
            Text(howManyGuesses)
            Text("_ _ _ _")
            Spacer()
            
            if anotherGuess {
                HStack {
                    // The text field should let the user input only 1 character for a guess.
                    // Every character needs to be automatically capitalized
                    // Auto correction needs to be disabled
                    // The user cannot input numbers or copy and paste other text
                    TextField("", text: $guessedLetter)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 30)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                        .onChange(of: guessedLetter) { _ in
                            // Only allows letters to be entered
                            guessedLetter = guessedLetter.trimmingCharacters(in: .letters.inverted)
                            // Grabbing the last character that was entered
                            guard let lastCharacter = guessedLetter.last else {
                                return
                            }
                            guessedLetter = String(lastCharacter).uppercased()
                        }
                    
                    Button("Guess Letter") {
                        anotherGuess = false
                    }
                    .buttonStyle(.bordered)
                    .tint(.mint)
                }
            } else {
                Button("Guess Another Word?") {
                    anotherGuess = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }
            
            Spacer()
            
            Image("flower8")
                .resizable()
                .scaledToFit()
                .padding()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
