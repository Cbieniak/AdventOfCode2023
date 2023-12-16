//
//  Day1Tests.swift
//
//
//  Created by ChristianBieniak on 7/12/2023.
//

@testable import AdventOfCode
import XCTest

final class Day2Tests: XCTestCase {
  
  func testCreatingRound() {
    
    XCTAssertEqual(Round(substring: "3 blue, 4 red"), Round(green: nil, blue: 3, red: 4))
    XCTAssertEqual(Round(substring: "1 red, 2 green, 6 blue"), Round(green: 2, blue: 6, red: 1))
    XCTAssertEqual(Round(substring: "4 red"), Round(green: nil, blue: nil, red: 4))
  }
  
  func testCreatingGame() {
    let testString = "Game 1: 3 blue, 4 red; 1 red, 12 green, 6 blue; 2 green"
    let expected = Game(id: 1, rounds: [
      .init(blue: 3, red: 4),
      .init(green: 12, blue: 6, red: 1),
      .init(green: 2)
    ])
    XCTAssertEqual(Game(string: testString) , expected)
  }
}
