//
//  MonitorNetworkUseCase.swift
//  NetworkMonitor
//
//  Created by 이상민 on 6/3/25.
//

import Foundation

protocol MonitorNetworkUseCase: AnyObject{
    var currentStatus: NetworkStatus { get }
    func startMonitoring()
    func stopMonitoring()
    var onStatusChange: ((NetworkStatus) -> Void)? {get set}
}
