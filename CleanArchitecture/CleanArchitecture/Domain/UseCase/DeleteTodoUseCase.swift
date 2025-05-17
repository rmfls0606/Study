//
//  DeleteTodoUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/17/25.
//

import Foundation

protocol DeleteTodoUseCase{
    func excute(id: UUID) async throws
}

class DeleteTodoUseCaseImpl: DeleteTodoUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func excute(id: UUID) async throws {
        try await repository.deleteTodo(id: id)
    }
}
