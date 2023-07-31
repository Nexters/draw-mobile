//
//  ContentController.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/31.
//

import WebKit

class ContentController: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "showBottomBar" {
            print("message name : \(message.name)")
            print("post Message : \(message.body)")
        } else if message.name == "showShareSheet" {
            print("message name : \(message.name)")
            print("post Message : \(message.body)")
        }
    }
}
