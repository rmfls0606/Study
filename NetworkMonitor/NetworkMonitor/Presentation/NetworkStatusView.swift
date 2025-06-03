//
//  NetworkStatusView.swift
//  NetworkMonitor
//
//  Created by 이상민 on 6/4/25.
//

import SwiftUI

struct NetworkStatusView: View {
    @State private var status: NetworkStatus = .disconnected
    private let monitor: MonitorNetworkUseCase = NetworkMonitor() //임시 직접 생성, 이후 DI 가능
    
    var body: some View {
        VStack(spacing: 20){
            switch status {
            case .connected(let type):
                Text("Connected via \(typeDescription(type))")
                    .foregroundStyle(.green)
            case .disconnected:
                Text("No Internet Connection")
                    .foregroundStyle(.red)
            }
        }
        .font(.title2)
        .padding()
        .onAppear {
            monitor.onStatusChange = { newStatus in
                self.status = newStatus
            }
            monitor.startMonitoring()
        }
        .onDisappear {
            monitor.stopMonitoring()
        }
    }
    
    private func typeDescription(_ type: NetworkType) -> String{
        switch type {
        case .wifi:
            return "WiFi"
        case .cellular:
            return "Cellular"
        case .ethernet:
            return "Ethernet"
        case .unknown:
            return "Unknown"
        }
    }
}

#Preview {
    NetworkStatusView()
}
