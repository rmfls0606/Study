//
//  MockFetchTodosUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/16/25.
//

import Foundation

class MockFetchTodosUseCase: FetchTodosUseCase {
    func excute() async throws -> [Todo] {
        return [
            Todo(id: UUID(), title: "Mock 할 일 1", isDone: false),
            Todo(id: UUID(), title: "Mock 할 일 2", isDone: true)
        ]
    }
}
