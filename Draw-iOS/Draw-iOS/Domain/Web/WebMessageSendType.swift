//
//  WebMessageSendType.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/04.
//

import Foundation

enum WebMessageSendType: CaseIterable {
    static var allCases: [WebMessageSendType] = [.navigate(.feed), .navigate(.question), .navigate(.myPage)]
    
    case navigate(MainScene)
    
    var jsCode: String {
        switch self {
        case let .navigate(scene):
            switch scene {
            case .onboarding: return navigateJSCode(path: .onboarding)
            case .feed: return navigateJSCode(path: .feed)
            case .question: return navigateJSCode(path: .newQuestion)
            case .myPage: return navigateJSCode(path: .myPage)
            }
        }
    }
}

extension WebMessageSendType {
    private func navigateJSCode(path: WebPathType) -> String {
        return "var navigateEvent = new CustomEvent('navigate', { detail: { url: '\(path.rawValue)' }}); window.dispatchEvent(navigateEvent);"
    }
}
