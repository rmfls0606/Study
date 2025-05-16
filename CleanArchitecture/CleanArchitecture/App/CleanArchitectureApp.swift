//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/14/25.
//

import SwiftUI

@main
struct CleanArchitectureApp: App {
    //앱 시작 시 ViewModel 생성(AppDIContainer 활용)
    @MainActor
    var body: some Scene {
        WindowGroup {
            TodoListView(vieWModel: AppDIContainer().makeTodoViewModel())
        }
    }
}
