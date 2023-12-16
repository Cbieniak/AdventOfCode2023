//
//  Day2Runner.swift
//
//
//  Created by ChristianBieniak on 9/12/2023.
//

import Foundation
import RegexBuilder

public struct Day2P1Runner: Runner {
  
  enum Error: LocalizedError {
    case invalidInput
  }
  
  // Returns the ID of any game thats possible
  public static func process(line: String) async throws -> Int? {
    guard let game = decodeGame(line: line) else {
      return 0
    }
    
    if game.rounds.allSatisfy({ round in
      return round.blue ?? 0 <= 14 &&
      round.green ?? 0 <= 13 &&
      round.red ?? 0 <= 12
    }) {
      return game.id
    }
    
    return 0
  }
  
  public static func reduce(units: [Int?]) -> Int {
    units.compactMap { $0 }.reduce(0, +)
  }
  
  private static func decodeGame(line: String) -> Game? {
   Game(string: line)
  }
}

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

public struct Round: Equatable {
  
  var green: Int = 0
  var blue: Int = 0
  var red: Int = 0
  
  init(green: Int = 0, blue: Int = 0, red: Int = 0) {
    self.green = green
    self.blue = blue
    self.red = red
  }
  
  init(substring: Substring) {
    if let result = substring.firstMatch(of: Self.createRegex(color: "blue")) {
      self.blue = result[Self.intRef]
    }
    
    if let result = substring.firstMatch(of: Self.createRegex(color: "green")) {
      self.green = result[Self.intRef]
    }
    
    if let result = substring.firstMatch(of: Self.createRegex(color: "red")) {
      self.red = result[Self.intRef]
    }
  }
  
  static let intRef = Reference(Int.self)
  
  static func createRegex(color: String) -> Regex<(Substring, Int)> {
    Regex {
      TryCapture(as: intRef) {
        OneOrMore(.digit, .reluctant)
      } transform: { match in
        Int(match)
      }
      " "
      color
    }
  }
}


