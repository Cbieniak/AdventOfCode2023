//
//  File.swift
//  
//
//  Created by ChristianBieniak on 7/12/2023.
//

import Foundation

public struct Day1Runner: Runner {
  
  enum Error: LocalizedError {
    case invalidInput
  }
  
  public static func process(line: String) async throws -> Int {
    let firstDigit = findWindowString(string: line)
    let secondDigit = findWindowEnd(string: line)
    
    guard let firstDigitString = firstDigit?.extractStringVal,
          let secondDigitString = secondDigit?.extractStringVal,
          let intVal = Int(firstDigitString + secondDigitString)  else {
      throw Error.invalidInput
    }
    
    return intVal
  }
  
  public static func reduce(units: [Int]) -> Int {
    units.reduce(0, +)
  }
  
  static func findWindowString(string: String) -> ValidNumber? {
    var windowStart = 0
    var windowSize = 1
    
    let stringArray = Array(string)
    
    while windowStart != stringArray.endIndex {
      // test all the windows
      let windowEnd = windowStart + windowSize
      if windowEnd > stringArray.endIndex {
        if windowSize < 4 {
          windowSize += 1
        } else {
          windowStart += 1
          windowSize = 1
        }
        continue
      }
      
      let window = stringArray[windowStart..<windowEnd]
      if let x = isNumber(string: String(window)) {
        return x
      }
      
      if windowSize < 5 {
        windowSize += 1
      } else {
        windowStart += 1
        windowSize = 1
      }
    }
    return nil
  }
  
  static func findWindowEnd(string: String) -> ValidNumber? {
    let stringArray = Array(string)
    var windowSize = 1
    var windowStart = stringArray.endIndex - windowSize
    
    while windowStart >= 0 {
      // test all the windows
      let windowEnd = windowStart + windowSize
      
      if windowEnd > stringArray.endIndex {
        if windowSize < 5 {
          windowSize += 1
        } else {
          windowStart -= 1
          windowSize = 1
        }
        continue
      }
      
      if windowStart < 0 {
        if windowSize < 5 {
          windowSize += 1
        } else {
          windowStart -= 1
          windowSize = 1
        }
        continue
      }
      let window = stringArray[windowStart..<windowEnd]
      if let x = isNumber(string: String(window)) {
        return x
      }
      
      if windowSize < 5 {
        windowSize += 1
      } else {
        windowStart -= 1
        windowSize = 1
      }
    }
    return nil
  }
  
  static func isNumber(string: String) -> ValidNumber? {
    if let firstChar = string.first, Int(String(firstChar)) != nil {
      return .rawInt(String(firstChar))
    }
    if let firstMatch = ValidNumber.allNumberCases.first(where: {
      string == $0.stringValue
    }) {
      return firstMatch
    }
    return nil
  }
}
