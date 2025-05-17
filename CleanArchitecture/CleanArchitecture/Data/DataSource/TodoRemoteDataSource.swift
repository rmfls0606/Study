//
//  TodoRemoteDataSource.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/15/25.
//

import Foundation

/*
 
 역할
 - 실제 API/DB가 준비되지 않은 상태에서 할 일 데이터를 임시로 저장하고 불러오는 기능 제공
 
 목적
 - UseCase와 ViewModel이 구현채애 의존하지 않도록 설계 테스트
 - API/DB 연동 전 단계에서 UI,로직 기능 먼저 개발 가능하게 함
 
 !!!실제 배포용이 아닌 테스트/개발 초기용 구성
 
 ???이게 없으면?
 - ViewModel/UseCase 테스트 불가
 - API/DB 준비될 때까지 전체 기능 개발 정지
 
 나중에 API/DB로 교체할 떄 이부분만 수정하거나 대체하면 됨
 
 */
class TodoRemoteDataSource{
    private var todos: [Todo] = []
    
    func fetchTodoFromAPI() async throws -> [Todo]{
        //실제 API 호출 없이 메모리에서 데이터 변환
        return todos
    }
    
    func addTodoToAPI(title: String) async throws{
        let newTodo = Todo(id: UUID(), title: title, isDone: false)
        //실제 서버에 보내지 않고, 메모리에 추가
        todos.append(newTodo)
    }
    
    func toggleTodoStatus(id: UUID) async throws{
        if let index = todos.firstIndex(where: { $0.id == id }){
            todos[index].isDone.toggle()
        }
    }
    
    func deleteTodo(id: UUID) async throws{
        todos.removeAll { $0.id == id }
    }
}
