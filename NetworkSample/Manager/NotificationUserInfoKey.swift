//
//  NotificationUserInfoKey.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/07/04.
//

import Foundation

/// 通知用UserInfoKey定義
public class NotificationUserInfoKey {
    /// 画面回転許可設定通知名文字列
    public static let supportedOrientationUserInfoKey = "supportedOrientation"
    /// 許可変更直後の画面位置
    public static let changeAfterOrientationUserInfoKey = "changeAfterOrientation"
    /// 実行されたCustomURLScheme
    public static let customUrlSchemeInfoUserInfoKey = "customUrlSchemeInfo"
    /// 変更を受信したネットワーク情報 NetworkInfo が入ります
    public static let networkInfoUserInfoKey = "networkInfoUserInfoKey"
}
