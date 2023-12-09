//
//  Executor.swift
//
//
//  Created by ChristianBieniak on 9/12/2023.
//

import Foundation

public struct RunnerExecutor<T: Runner> {
  
  let runner: T
  
  public init(runner: T) {
    self.runner = runner
  }
  
  public func execute(_ fileUrl: URL) async throws -> T.Result {
    try await execute(fileUrl.lines)
  }
  
  public func execute(_ lines: AsyncLineSequence<URL.AsyncBytes>) async throws -> T.Result {
    try await withThrowingTaskGroup(of: T.Unit.self, returning: T.Result.self) { taskGroup in
      for try await line in lines {
        taskGroup.addTask { try await T.process(line: line) }
      }
      var units = [T.Unit]()
      for try await unit in taskGroup {
        units.append(unit)
      }
      return T.reduce(units: units)
    }
  }
}
