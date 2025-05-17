//
//  TodoListView.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/16/25.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject private var vieWModel: TodoViewModel
    @State private var newTodoTitle: String = ""
    
    init(vieWModel: TodoViewModel) {
        _vieWModel = StateObject(wrappedValue: vieWModel)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(vieWModel.todos, id: \.id){ todo in
                    HStack{
                        Button {
                            Task{
                                await vieWModel.toggleTodo(id: todo.id)
                            }
                        } label: {
                            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(todo.isDone ? .green : .green)
                        }

                        Text(todo.title)
                    }//: HSTACK
                }//: LIST
                
                HStack{
                    TextField("할 일 입력", text: $newTodoTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("추가") {
                        Task{
                            await vieWModel.addTodo(title: newTodoTitle)
                            newTodoTitle = ""
                        }
                    }
                }//: HSTACK
                .padding(.horizontal)
            }//: VSTACK
            .navigationTitle("할 일 목록")
        }//: NAVIGATIONVIEW
        .task {
            await vieWModel.loadTodos()
        }
    }
}

#Preview {
    let viewModel = TodoViewModel(
        fetchTodosUseCase: MockFetchTodosUseCase(),
        addTodoUseCase: MockAddTodoUseCase(),
        toggleTodoStatusUseCase: MockToggleStatusUseCase()
    )
    TodoListView(vieWModel: viewModel)
}
