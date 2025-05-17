//
//  MockToggleStatusUseCase.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/17/25.
//

import Foundation

class MockToggleStatusUseCase: ToggleTodoStatusUseCase{
    func excute(id: UUID) async throws {
        print("Preview용 Toggle 실행됨")
        //실제로는 아무 것도 안 해도 됨
    }
}
