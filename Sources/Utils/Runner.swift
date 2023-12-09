//
//  File.swift
//  
//
//  Created by ChristianBieniak on 9/12/2023.
//

import Foundation

public protocol Runner {
  associatedtype Unit
  associatedtype Result
  
  static func process(line: String) async throws -> Unit
  
  static func reduce(units: [Unit]) -> Result
}
