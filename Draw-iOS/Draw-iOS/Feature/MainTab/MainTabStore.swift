//
//  MainTabStore.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import Foundation

import ComposableArchitecture

struct MainTabViewStore: ReducerProtocol {

    struct State: Equatable {
        @PresentationState var urlSharing: URLSharingStore.State?
        
        var currentScene: MainScene = .onboarding
        
        var isShowTabBar: Bool = false
        var isShareSheetPresented: Bool = false
        var shareUrl: String?
        
        var feed: FeedStore.State = .init()
        var question: QuestionStore.State = .init()
        var myPage: MyPageStore.State = .init()
    }
    
    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case urlSharing(PresentationAction<URLSharingStore.Action>)
        
        case selectTab(MainScene)
        case showTabBar(Bool)
        
        case shareURL(url: URL)
        
        case setShareSheet(isPresented: Bool)
        
        case feed(FeedStore.Action)
        case question(QuestionStore.Action)
        case myPage(MyPageStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case let .selectTab(scene):
                state.currentScene = scene
                
                return .none
                
            case let .showTabBar(isShow):
                state.isShowTabBar = isShow
                return .none
                
            case let .shareURL(url):
                state.urlSharing = .init(url: url)
                return .none
                
            default: return .none
            }
        }
        
        Scope(state: \.feed, action: /Action.feed) {
            FeedStore()._printChanges()
        }
        
        Scope(state: \.question, action: /Action.question) {
            QuestionStore()._printChanges()
        }
        
        Scope(state: \.myPage, action: /Action.myPage) {
            MyPageStore()._printChanges()
        }
        
        .ifLet(\.$urlSharing, action: /Action.urlSharing) {
            URLSharingStore()
        }
    }
}
