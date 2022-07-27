//
//  ContentView.swift
//  WhatFlagIsThis
//
//  Created by Richard Nkanga on 24/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
  

    
    @State var countries = ["Estonia","France","Germany","Ireland", "Italy", "Monaco","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    
        
    @State var correctAnswer = Int.random(in: 0...2)
    
    
 
    
    var body: some View {
        
     
        ZStack {
            Color.blue.ignoresSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                    Text("Your Score is \(score) ")
                        .foregroundColor(.white)
                }
        
            
            ForEach(0..<3){ number in
                Button {
                    
                    flagtapped(number)
                    
                    
                    
                } label: {
                    Image(countries[number])
                        .renderingMode(.original)
                }
            }
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }message: {
            Text("Your score is \(score)")
        }
        
    
        }
    
    func flagtapped(_ number: Int ){
        if number == correctAnswer{
            scoreTitle = "Correct Answer"
            score += 1
    }else{
        scoreTitle = "Wrong Answer"
        
    }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        
      
    }
        
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
