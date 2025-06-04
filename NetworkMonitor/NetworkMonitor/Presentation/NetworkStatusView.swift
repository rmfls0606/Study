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
    @State private var showToast: Bool = false
    
    var body: some View {
        ZStack{
            if case .connected(let type) = status {
                Text(typeDescription(type))
                    .font(.title)
            }
            
            if case .disconnected = status {
                VStack(spacing: 16) {
                    Text("네트워크 연결이 일시적으로 원활하지 않습니다.\n데이터 또는 Wi-Fi 연결 상태를 확인해주세요.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground).opacity(0.9))
            }
            
            if showToast{
                VStack{
                    Spacer()
                    Text("네트워크 통신이 원활하지 않습니다.")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.8))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.bottom, 40)
                }
            }
        }
        .onAppear {
            monitor.onStatusChange = { newStatus in
                self.status = newStatus
                if case .disconnected = newStatus {
                    self.showToast = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        self.showToast = false
                    }
                }
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
