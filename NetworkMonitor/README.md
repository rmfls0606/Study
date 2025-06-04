# NetworkMonitor

네트워크 연결 상태에 따라 안내 화면 및 토스트 메시지를 제공하는 SwiftUI 기반의 간단한 앱입니다.  
Clean Architecture의 기본 구조를 적용하여 유지보수가 용이하도록 설계되었습니다.
<br></br>

## 앱 목적
---
네트워크 연결 여부에 따라 실시간으로 사용자에게 안내합니다.

연결이 끊긴 경우에는 **화면 중앙 오버레이**와 **하단 토스트 메시지**를 통한 알림을 제공합니다.
<br></br>

## 기술 스택
---
| 분류          | 기술명                      | 뱃지 |
|---------------|------------------------------|------|
| UI          | SwiftUI                      | ![SwiftUI](https://img.shields.io/badge/SwiftUI-00bfff?logo=swift&logoColor=white) |
| 네트워크 감지 | Network Framework / NWPathMonitor | ![Network](https://img.shields.io/badge/Network_Framework-informational?logo=apple&logoColor=white&color=gray) |
| 아키텍처    | Clean Architecture (단일 View 기반) | ![Clean Architecture](https://img.shields.io/badge/Clean--Architecture-Swift-orange) |
<br></br>

## 프로젝트 구조
---

```
Domain
|- NetworkStatus.swift
|- 📄 MonitorNetworkUseCase.swift

Data
|- 📄 NetworkMonitor.swift

Presentation
|- 📄 NetworkStatusView.swift
```
<br></br>

## 사용한 프레임워크
---

### `Network` Framework (Apple)
Apple이 제공하는 네트워크 감지 및 설정용 프레임워크입니다.

네트워크 경로의 상태를 모니터링하고, 연결 가능 여부, 연결 유형(Wi-Fi, 셀룰러 등), 네트워크 인터페이스의 세부 특성 등을 판단할 수 있습니다.

iOS 12 이상에서 지원됩니다.
<br></br>

### `NWPathMonitor`

`NWPathMonitor`는 네트워크 경로의 상태를 실시간으로 감지하기 위한 클래스입니다. 앱에서 **네트워크 연결 상태에 따른 동작을 세밀하게 제어**해야 할 때 유용하게 사용됩니다.

#### ✅ 주요 특징

1. **실시간 모니터링**: 네트워크 상태 변경 시 즉시 콜백이 전달됩니다.
2. **네트워크 유형 감지**: Wi-Fi, 셀룰러, 이더넷 등의 연결 유형 파악 가능
3. **연결 품질 평가**: path의 상태(.satisfied / .unsatisfied) 등을 통해 네트워크 가용성 판단
4. **IPv4 / IPv6 지원**: 다양한 환경에서의 연결을 포괄적으로 감지

#### 💡 대표 사용 사례

- **네트워크 변경 대응**: Wi-Fi → 셀룰러 전환 등 네트워크 변경 감지
- **오프라인 모드 처리**: 네트워크가 끊긴 경우 사용자에게 안내하거나 오프라인 모드 제공
- **연결 상태에 따라 동작 최적화**: 예를 들어, 낮은 품질 연결 시 영상 스트리밍을 자동으로 저화질로 전환
<br></br>

#### 📌 코드 예시

```swift
let monitor = NWPathMonitor()
monitor.pathUpdateHandler = { path in
    if path.status == .satisfied {
        print("인터넷 연결됨")
    } else {
        print("인터넷 연결 안됨")
    }

    if path.usesInterfaceType(.wifi) {
        print("Wi-Fi 연결")
    } else if path.usesInterfaceType(.cellular) {
        print("셀룰러 연결")
    }
}
monitor.start(queue: DispatchQueue.global(qos: .background))
```
