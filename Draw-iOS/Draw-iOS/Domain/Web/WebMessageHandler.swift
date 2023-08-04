//
//  WebMessageHandler.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/31.
//

import WebKit

class WebMessageHandler: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        print("message name : \(message.name)")
        print("post Message : \(message.body)")
        
        switch message.name {
        case WebMessageReceiveType.showBottomBar.rawValue:
            guard let value = message.body as? String else { break }
            NotificationCenterManager.send(.showBottomBar, value: value == "true")
            
        case WebMessageReceiveType.showShareSheet.rawValue:
            guard let value = message.body as? String else { break }
            NotificationCenterManager.send(.showShareSheet, value: value == "true")
            
        default:
            break
        }
    }
}
