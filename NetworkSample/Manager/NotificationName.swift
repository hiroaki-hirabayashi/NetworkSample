//
//  NotificationName.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/07/04.
//

import Foundation

/// 通知名定義
public class NotificationName {
    /// 画面回転許可設定通知名
    /// - userInfoに設定するKey一覧:
    /// - NotificationUserInfoKey.supportedOrientationUserInfoKey: 必須
    /// - UIInterfaceOrientationMask: 画面回転許可設定のキー
    /// - NotificationUserInfoKey.changeAfterOrientationUserInfoKey: 任意
    /// - UIDeviceOrientation: 許可変更後の画面の向き設定のキー
    public static let supportedOrientationChange = Notification.Name(rawValue: "SupportedOrientationChange")

    /// ネットワークの変更を通知する
    public static let networkPathUpdate = Notification.Name("networkPathUpdate")

    /// プラットフォームトップ用URLScheme識別通知キー
    static let urlSchemeModuleKeyPlatformTop = "urlSchemeModuleKeyPlatformTop"

    /// ストレッチモジュール用URLScheme識別通知キー
    static let urlSchemeModuleKeyStratch = "urlSchemeModuleKeyStratch"

    /// 健康習慣用URLScheme識別通知キー
    static let urlSchemeModuleKeyHabits = "urlSchemeModuleKeyHabits"

    /// 読み物用URLScheme識別通知キー
    static let urlSchemeModuleKeyArticle = "urlSchemeModuleKeyArticle"
}
