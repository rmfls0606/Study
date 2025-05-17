//
//  TodoViewModel.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/16/25.
//

import Foundation

@MainActor
class TodoViewModel: ObservableObject{
    @Published var todos: [Todo] = []
    
    //추상화된 UseCase 주입(DIP 유지)
    private let fetchTodosUseCase: FetchTodosUseCase
    private let addTodoUseCase: AddTodoUseCase
    private let toggleTodoStatusUseCase: ToggleTodoStatusUseCase
    private let deleteTodoUseCase: DeleteTodoUseCase
    
    init(
        fetchTodosUseCase: FetchTodosUseCase,
        addTodoUseCase: AddTodoUseCase,
        toggleTodoStatusUseCase: ToggleTodoStatusUseCase,
        deleteTodoUseCase: DeleteTodoUseCase
    ){
        self.fetchTodosUseCase = fetchTodosUseCase
        self.addTodoUseCase = addTodoUseCase
        self.toggleTodoStatusUseCase = toggleTodoStatusUseCase
        self.deleteTodoUseCase = deleteTodoUseCase
    }
    
    func loadTodos() async{
        do{
            todos = try await fetchTodosUseCase.excute()
        }catch{
            print("Todo 불러오기 실패: \(error.localizedDescription)")
        }
    }
    
    func addTodo(title: String) async{
        do{
            try await addTodoUseCase.excute(title: title)
            await loadTodos() //추가 후 목록 새로고침
        }catch{
            print("Todo 추가 실패: \(error.localizedDescription)")
        }
    }
    
    func toggleTodo(id: UUID) async{
        do{
            try await toggleTodoStatusUseCase.excute(id: id)
            await loadTodos()
        }catch{
            print("상태 토글 실패: \(error.localizedDescription)")
        }
    }
    
    func deleteTodo(id: UUID) async{
        do{
            try await deleteTodoUseCase.excute(id: id)
            await loadTodos()
        }catch{
            print("삭제 실패: \(error.localizedDescription)")
        }
    }
}
