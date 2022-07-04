//
//  NetworkSampleView.swift
//  NetworkSample
//
//  Created by Hiroaki-Hirabayashi on 2022/07/03.
//
import Network
import SwiftUI

struct NetworkSampleView: View {
    @State var nwInfo: NetworkInfo = NetworkManager.shared.currentInfo
    
    struct ShowInfo {
        var network: String
        var type: String
        var icon: String
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            let info = getShowInfo()
            Text(info.network)
            Text(info.type)
        }
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: NotificationName.networkPathUpdate,
                object: nil,
                queue: .main
            ) { notification in
                if let nwInfo = notification.userInfo?[NotificationUserInfoKey.networkInfoUserInfoKey] as? NetworkInfo {
                    self.nwInfo = nwInfo
                    print("path", self.nwInfo)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        let test = NetworkManager.shared.currentInfo
                        print("current", test)
                    }
                }
            }
        }
    }
}

extension NetworkSampleView {
    func getShowInfo() -> ShowInfo {
        var network = ""
        var type = ""
        var icon = ""
        
        network = nwInfo.isOnline() ? "online" : "offline"
        if nwInfo.isExpensive {
            network += " isExpensive"
        }
        if nwInfo.isConstrained {
            network += " isConstrained"
        }
        
        type = nwInfo.typeString()
        return ShowInfo(network: network, type: type, icon: icon)
    }
}

// Extension コンテンツが使用する関数を定義
extension NetworkInfo {
    var isConstrained: Bool {
        return nwPath.isConstrained
    }
    
    func typeString() -> String {
        var type = ""
        if nwPath.usesInterfaceType(.wifi) {
            type += " wifi"
        }
        if nwPath.usesInterfaceType(.cellular) {
            type += " cellular"
        }
        if nwPath.usesInterfaceType(.wiredEthernet) {
            type += " wiredEthernet"
        }
        if nwPath.usesInterfaceType(.loopback) {
            type += " loopback"
        }
        if nwPath.usesInterfaceType(.other) {
            type += " other"
        }
        
        return type
    }
}

struct NetworkSampleView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkSampleView()
    }
}


