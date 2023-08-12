//
//  Url+Extension.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import Foundation

extension URL {
    static let onboarding: Self = URL(string: "\(Bundle.main.url)/")!
    static let feed: Self = URL(string: "\(Bundle.main.url)/feed")!
    static let feedDetail: Self = URL(string: "\(Bundle.main.url)/question-detail")!
    static let myPage: Self = URL(string: "\(Bundle.main.url)/my-page")!
    static let myPageSetting: Self = URL(string: "\(Bundle.main.url)/my-page/setting")!
    static let newQuestion: Self = URL(string: "\(Bundle.main.url)/new-question")!
    
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
