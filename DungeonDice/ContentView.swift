//
//  ContentView.swift
//  DungeonDice
//
//  Created by Paul Wagstaff on 2025-11-26.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var rollMessage = ""
    
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
                .frame(width: .infinity, height: 180)
            Spacer()

            Group {
                HStack {
                    Button {
                        rollMessage = "You rolled a \(Dice.four.roll()) on the \(Dice.four)-sided die."
                    } label: {
                        Text("\(Dice.four.rawValue)-sided die")
                    }
                    Button {
                        rollMessage = "You rolled a \(Dice.six.roll()) on the \(Dice.six)-sided die."
                    } label: {
                        Text("\(Dice.six.rawValue)-sided die")
                    }
                    Button {
                        rollMessage = "You rolled a \(Dice.eight.roll()) on the \(Dice.eight)-sided die."
                    } label: {
                        Text("\(Dice.eight.rawValue)-sided die")
                    }
                }
                HStack {
                    Button {
                        rollMessage = "You rolled a \(Dice.ten.roll()) on the \(Dice.ten)-sided die."
                    } label: {
                        Text("\(Dice.ten.rawValue)-sided die")
                    }
                    Button {
                        rollMessage = "You rolled a \(Dice.twelve.roll()) on the \(Dice.twelve)-sided die."
                    } label: {
                        Text("\(Dice.twelve.rawValue)-sided die")
                    }
                    Button {
                        rollMessage = "You rolled a \(Dice.twenty.roll()) on the \(Dice.twenty)-sided die."
                    } label: {
                        Text("\(Dice.twenty.rawValue)-sided die")
                    }
                }
                Button {
                    rollMessage = "You rolled a \(Dice.hundred.roll()) on the \(Dice.hundred)-sided die."
                } label: {
                    Text("\(Dice.hundred.rawValue)-sided die")
                }
            }
            .font(.caption)
            .buttonStyle(.borderedProminent)
            .tint(.red)



        }
        .padding()
    }
}

#Preview {
    ContentView()
}
