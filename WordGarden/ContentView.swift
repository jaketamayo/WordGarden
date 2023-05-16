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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
