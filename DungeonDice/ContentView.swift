//
//  ContentView.swift
//  DungeonDice
//
//  Created by Paul Wagstaff on 2025-11-26.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable, Identifiable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var id: Int {
            return self.rawValue
        }
        var description: String {
            return "\(self.rawValue)-sided"
        }
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var rollMessage = ""
    @State private var animationToggle: Bool = false
    @State private var isDoneAnimating: Bool = true
    
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            Spacer()
            Text(rollMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (x:1, y:0, z:0), anchor: .center, anchorZ: 0, perspective: (5.5))
                .frame(height: 150)
                .onChange(of: animationToggle) {
                    isDoneAnimating = false
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)) {
                        isDoneAnimating = true
                    }
                }
            Spacer()
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
                ForEach(Dice.allCases) { die in
                    Button(die.description) {
                        rollMessage = "You rolled a \(die.roll()) on the \(die)-sided die."
                        animationToggle.toggle()
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
