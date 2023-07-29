//
//  TabBarViewModel.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import Foundation
import Combine

enum Tab { case feed, question, myPage }

final class TabBarViewModel: ObservableObject {
    @Published var currentTab: Tab = .feed
}
