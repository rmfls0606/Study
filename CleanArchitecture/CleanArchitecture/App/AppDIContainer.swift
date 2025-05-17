//
//  AppDIContainer.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/17/25.
//

import Foundation

struct AppDIContainer{
    @MainActor
    func makeTodoViewModel() -> TodoViewModel{
        //실제 데이터 소스(현재는 테스트용 메모리 DataSource 사용)
        let dataSource = TodoRemoteDataSource()
        
        //Repository 생성
        let repository = TodoRepositoryImpl(remoteDataSource: dataSource)
        
        //UseCase 생성
        let fetchUseCase = FetchTodosUseCaseImpl(repository: repository)
        let addUseCase = AddTodoUseCaseImpl(repository: repository)
        let toggleUseCase = ToggleTodoStatusUseCaseImpl(
            repository: repository
        )
        let delteUseCase = DeleteTodoUseCaseImpl(repository: repository)
        
        //ViewModel 생성
        return TodoViewModel(
            fetchTodosUseCase: fetchUseCase,
            addTodoUseCase: addUseCase,
            toggleTodoStatusUseCase: toggleUseCase,
            deleteTodoUseCase: delteUseCase
        )
    }
}
