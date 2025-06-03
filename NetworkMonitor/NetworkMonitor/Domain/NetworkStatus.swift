//
//  NetworkStatus.swift
//  NetworkMonitor
//
//  Created by 이상민 on 6/3/25.
//

import Foundation

enum NetworkStatus: Equatable{
    case connected(NetworkType) //어떤 타입으로 연결
    case disconnected //비연결
}

enum NetworkType{
    case wifi //와이파이
    case cellular //셀룰러
    case ethernet //이더넷
    case unknown //알 수 없음
}
