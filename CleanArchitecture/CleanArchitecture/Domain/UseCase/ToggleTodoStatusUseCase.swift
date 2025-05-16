//
//  ToggleTodoStatusUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/17/25.
//

import Foundation

protocol ToggleTodoStatusUseCase{
    func excute(id: UUID) async throws
}

class ToggleTodoStatusUseCaseImpl: ToggleTodoStatusUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository){
        self.repository = repository
    }
    
    func excute(id: UUID) async throws {
        try await repository.toggleTodoStatus(id: id)
    }
}
