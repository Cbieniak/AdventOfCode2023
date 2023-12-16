//
//  File.swift
//  
//
//  Created by ChristianBieniak on 16/12/2023.
//

import Foundation
import RegexBuilder

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
