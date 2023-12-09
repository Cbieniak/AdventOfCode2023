//
//  File.swift
//  
//
//  Created by ChristianBieniak on 7/12/2023.
//

import Foundation

enum ValidNumber {
  
  case one
  case two
  case three
  case four
  case five
  case six
  case seven
  case eight
  case nine
  case rawInt(String)
  
  static let allNumberCases: [Self] = [.one, .two, .three, .four, .five, .six, .seven, .eight, .nine]
  
  var extractStringVal: String? {
    switch self {
      case .rawInt(let val):
        return String(val)
      case .one:
        return "1"
      case .two:
        return "2"
      case .three:
        return "3"
      case .four:
        return "4"
      case .five:
        return "5"
      case .six:
        return "6"
      case .seven:
        return "7"
      case .eight:
        return "8"
      case .nine:
        return "9"
    }
  }
  
  var stringValue: String? {
    switch self {
      case .one:
        return "one"
      case .two:
        return "two"
      case .three:
        return "three"
      case .four:
        return "four"
      case .five:
        return "five"
      case .six:
        return "six"
      case .seven:
        return "seven"
      case .eight:
        return "eight"
      case .nine:
        return "nine"
      case .rawInt(_):
        return nil
    }
  }
}
