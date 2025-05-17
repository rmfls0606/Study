//
//  MockDeleteTodoUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/17/25.
//

import Foundation

class MockDeleteTodoUseCase: DeleteTodoUseCase {
    func excute(id: UUID) async throws {
        print("Mock Delete 실행됨")
    }
}
