//
//  PathType.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/04.
//

import Foundation

public enum WebPathType: String, CaseIterable {
    case onboarding = "/"
    case feed = "/feed"
    case feedDetail = "/question-detail"
    case myPage = "/my-page"
    case myPageSetting = "/my-page/setting"
    case newQuestion = "/new-question"
}
