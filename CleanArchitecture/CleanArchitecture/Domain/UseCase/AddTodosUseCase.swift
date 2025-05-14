//
//  AddTodosUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/15/25.
//

import Foundation

protocol AddTodoUseCase{
    func excute(title: String) async throws
}

class AddTodoUseCaseImpl: AddTodoUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func excute(title: String) async throws {
        try await repository.addTodo(title: title)
    }
}
