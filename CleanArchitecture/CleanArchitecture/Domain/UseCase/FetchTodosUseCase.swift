//
//  FetchTodosUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/15/25.
//

import Foundation

protocol FetchTodosUseCase{
    func excute() async throws -> [Todo]
}

class FetchTodosUseCaseImpl: FetchTodosUseCase{
    private let repository: TodoRepository
    
    init(repository: TodoRepository){
        self.repository = repository
    }
    
    func excute() async throws -> [Todo]{
        return try await repository.fetchTodos()
    }
}
