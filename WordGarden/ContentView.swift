//
//  ContentView.swift
//  WordGarden
//
//  Created by Jacob Tamayo on 5/16/23.
//

import SwiftUI

struct ContentView: View {

    @State private var wordsGuessed = 0
    @State private var wordsMissed = 0
    @State private var wordsInGame = 0
    // currentWordIndex is used for indexing the list of words in wordsToGuess
    @State private var currentWordIndex = 0
    // wordToGuess is a variable that will hold the current word being guessed from the wordsToGuess array
    @State private var wordToGuess = ""
    @State private var lettersThatUserGuessed = ""
    @State private var howManyGuesses = "How many words are in this guess"
    @State private var letterThatUserGuessed = ""
    @State private var anotherGuess = true
    
    
    
    
    // The words that the user is challenged to guess will show up as underscores
    @State private var revealedWord = ""
    
    @FocusState private var textFieldIsFocused: Bool
    
    // A list of words that will be used to challenge the user to guess
    private var wordsToGuess = ["SWIFT", "PYTHON", "JAVASCRIPT" ]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("Words Missed: \(wordsMissed) ")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Words to Guess: \(wordsToGuess.count)")
                    Text("Words in Game: \(wordsInGame)")
                }
            }
            .padding()
            
            Spacer()
            
            Text(howManyGuesses)
            
            /// TODO: You need to initialize `revealWord` and `wordToGuess` when the app starts
            Text(revealedWord)
            
            Spacer()
            
            if anotherGuess {
                HStack {
                    // The text field should let the user input only 1 character for a guess.
                    // Every character needs to be automatically capitalized
                    // Auto correction needs to be disabled
                    // The user cannot input numbers or copy and paste other text
                    TextField("", text: $letterThatUserGuessed)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 30)
                        .keyboardType(.asciiCapable)
                        .submitLabel(.done)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                        .onChange(of: letterThatUserGuessed) { _ in
                            // Only allows letters to be entered
                            letterThatUserGuessed = letterThatUserGuessed.trimmingCharacters(in: .letters.inverted)
                            // Grabbing the last character that was entered
                            guard let lastCharacter = letterThatUserGuessed.last else {
                                return
                            }
                            letterThatUserGuessed = String(lastCharacter).uppercased()
                        }
                        .focused($textFieldIsFocused)
                    
                    Button("Guess Letter") {
                        textFieldIsFocused = false
                        // TODO: Modify the -revealedWord- so that it shows any letter that the player has guessed right
                        lettersThatUserGuessed = lettersThatUserGuessed + letterThatUserGuessed
                        
                        revealedWord = ""
                        
                        for letter in wordToGuess {
                            // check if the letter in wordToGuess is in the variable `lettersThatUserHasGuessed`
                            if lettersThatUserGuessed.contains(letter) {
                                revealedWord = revealedWord + "\(letter)"
                            } else {
                                revealedWord  = revealedWord + "_ "
                            }

                        }
                        letterThatUserGuessed = ""
                        
                    }
                    .buttonStyle(.bordered)
                    .tint(.mint)
                    .disabled(letterThatUserGuessed.isEmpty)
                }
            } else {
                Button("Guess Another Word?") {
                    //
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
        .onAppear() {
            wordToGuess = wordsToGuess[currentWordIndex]
            // initailizing 'revealedWord` to a repeated string with underscores, and using `wordToGuess` as the number of underscores to display
            revealedWord =  String(repeating: " _", count: wordToGuess.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
