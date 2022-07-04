//
//  NetworkInfo.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/07/04.
//

import Foundation
import Network

/// ネットワーク監視状況を通知する情報
///
/// コンテンツで必要な処理は、Extensionなどで追加してください。
/// 共通で使う場合は、ここに追加してください。
public struct NetworkInfo {
    /// 利用可能なネットワーク情報
    public var nwPath: NWPath

    /// ネットワークパスがオンラインか
    public func isOnline() -> Bool {
        return nwPath.status == .satisfied
    }

    /// ネットワークパスがCellularやPersonalHotspotなどの高価と見なされるインターフェイスを使用しているか
    public var isExpensive: Bool {
        return nwPath.isExpensive
    }
}

