//
//  TodoRepository.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/14/25.
//

import Foundation

protocol TodoRepository{
    func fetchTodos() async throws -> [Todo]
    func addTodo(title: String) async throws
    func toggleTodoStatus(id: UUID) async throws
}
