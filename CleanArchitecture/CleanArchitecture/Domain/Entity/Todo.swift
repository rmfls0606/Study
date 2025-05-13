//
//  Todo.swift
//  CleanArchitecture
//
//  Created by 이상민 on 5/14/25.
//

import Foundation

struct Todo: Identifiable{
    let id: UUID
    let title: String
    let isDone: Bool
}
