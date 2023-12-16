//
//  File.swift
//  
//
//  Created by ChristianBieniak on 16/12/2023.
//

import Foundation
import RegexBuilder

public struct Game: Equatable {
  let id: Int
  let rounds: [Round]
  
  init(id: Int, rounds: [Round]) {
    self.id = id
    self.rounds = rounds
  }
  
  init?(string: String) {
    let gameRef = Reference(Int.self)
    
    let regex = Regex {
      "Game"
      " "
      TryCapture(as: gameRef) {
        OneOrMore(.digit)
      } transform: { match in
        Int(match)
      }
      
    }

    guard let game = string.firstMatch(of: regex) else {
      return nil
    }
    self.id = game[gameRef]
    self.rounds = string.split(separator: ";").compactMap {
      return Round(substring: $0)
    }
  }
}
