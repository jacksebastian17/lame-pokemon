//
//  ContentView.swift
//  Shared
//
//  Created by Jack Sebastian on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pokemon1 = "pokeball"
    @State private var pokemon2 = "pokeball"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    @State private var playerRand = 0
    @State private var cpuRand = 0
    @State private var playerColor = Color.white
    @State private var cpuColor = Color.white
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(pokemon1)
                    Spacer()
                    Image(pokemon2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Power Level")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 12.0)
                        Text(String(playerRand))
                            .font(.largeTitle)
                            .foregroundColor(playerColor)
                            .padding([.bottom, .trailing], 10.0)
                    }
                    Spacer()
                    VStack {
                        Text("Power Level")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.leading, 12.0)
                        Text(String(cpuRand))
                            .font(.largeTitle)
                            .foregroundColor(cpuColor)
                            .padding([.leading, .bottom], 10.0)
                    }
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    playerRand = Int.random(in: 1...36)
                    cpuRand = Int.random(in: 1...36)
                    
                    pokemon1 = "card" + String(playerRand)
                    pokemon2 = "card" + String(cpuRand)
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                    }
                    else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    
                    if playerRand >= 1 && playerRand <= 12 {
                        playerColor = Color.red
                    }
                    if playerRand >= 13 && playerRand <= 24 {
                        playerColor = Color.yellow
                    }
                    if playerRand >= 25 && playerRand <= 36 {
                        playerColor = Color.green
                    }
                    
                    if cpuRand >= 1 && cpuRand <= 12 {
                        cpuColor = Color.red
                    }
                    if cpuRand >= 13 && cpuRand <= 24 {
                        cpuColor = Color.yellow
                    }
                    if cpuRand >= 25 && cpuRand <= 36 {
                        cpuColor = Color.green
                    }
                    
                }, label: {
                    Image("battle")
                })
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("You")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("Trainer")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
