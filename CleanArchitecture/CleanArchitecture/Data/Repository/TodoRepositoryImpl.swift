//
//  TodoRepositoryImpl.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/15/25.
//

import Foundation

/*
 
 역할
 - TodoRepository 프로토콜을 구현하여 UseCase에 실제 데이터 기능을 제공하는 클래스
 - 실제 데이터 접근은 내부 DataSource(TodoTremoteDataSource)에 위임
 
 목적
 - UseCase는 이 구현체를 몰라도 되고, 오직 TodoRepository라는 추상화(프로토콜)에만 의존함
 - 구현체는 UseCase(상위 모듈)의 추상화에 의존함으로써 DIP(의존성 역전 원칙)을 만족함
 
 */

class TodoRepositoryImpl: TodoRepository{
    private let remoteDataSource: TodoRemoteDataSource
    
    init(remoteDataSource: TodoRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchTodos() async throws -> [Todo]{
        return try await remoteDataSource.fetchTodoFromAPI()
    }
    
    func addTodo(title: String) async throws {
        try await remoteDataSource.addTodoToAPI(title: title)
    }
    
    func toggleTodoStatus(id: UUID) async throws {
        try await remoteDataSource.toggleTodoStatus(id: id)
    }
    
    func deleteTodo(id: UUID) async throws{
        try await remoteDataSource.deleteTodo(id: id)
    }
}
