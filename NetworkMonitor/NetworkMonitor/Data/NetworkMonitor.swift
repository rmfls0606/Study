//
//  NetworkMonitor.swift
//  NetworkMonitor
//
//  Created by 이상민 on 6/4/25.
//

import Foundation
import Network

final class NetworkMonitor: MonitorNetworkUseCase {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    private(set) var currentStatus: NetworkStatus = .disconnected
    var onStatusChange: ((NetworkStatus) -> Void)?
    
    func startMonitoring(){
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            let newStatus: NetworkStatus
            
            if path.status == .satisfied{ //연결이 되어있으면
                if path.usesInterfaceType(.wifi){
                    newStatus = .connected(.wifi)
                }else if path.usesInterfaceType(.cellular){
                    newStatus = .connected(.cellular)
                }else if path.usesInterfaceType(.wiredEthernet){
                    newStatus = .connected(.ethernet)
                }else{
                    newStatus = .connected(.unknown)
                }
            }else{ //연결이 안되어있으면
                newStatus = .disconnected
            }
            
            if newStatus != self.currentStatus{
                self.currentStatus = newStatus
                DispatchQueue.main.async {
                    self.onStatusChange?(newStatus)
                }
            }
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring(){
        monitor.cancel()
    }
}
