//
//  NetworkManager.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/07/04.
//

import Foundation
import Network

/// ネットワークの変更を監視
///
/// ネットワークの変更をNotificationName.networkPathUpdateで通知します。
/// ネットワークの監視を開始するにはsetupを実行してください。
public class NetworkManager {
    /// シングルトン
    public static let shared = NetworkManager()
    
    /// モニター
    private let monitor = NWPathMonitor()
    
    /// ネットワーク監視開始
    public func setUp() {
        monitor.pathUpdateHandler = { path in
            self.postNotification(nwInfo: NetworkInfo(nwPath: path))
        }
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.start(queue: queue)
    }
    
    /// オンライン判定
    public func isOnline() -> Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    /// 現在のネットワークパスを取得する
    public var currentInfo: NetworkInfo {
        return NetworkInfo(nwPath: monitor.currentPath)
    }
    
    /// 変更のあったネットワークパスを通知する
    private func postNotification(nwInfo: NetworkInfo) {
        NotificationCenter.default.post(
            name: NotificationName.networkPathUpdate,
            object: nil,
            userInfo: [
                NotificationUserInfoKey.networkInfoUserInfoKey: nwInfo
            ]
        )
    }
}

