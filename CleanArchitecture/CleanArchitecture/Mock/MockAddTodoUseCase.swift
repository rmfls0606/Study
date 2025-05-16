//
//  MockAddTodoUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/16/25.
//

import Foundation

class MockAddTodoUseCase: AddTodoUseCase{
    func excute(title: String) async throws {
        print("\(title)을(를) Mock으로 추가했습니다.(실제 저장은 안 됨)")
    }
}
