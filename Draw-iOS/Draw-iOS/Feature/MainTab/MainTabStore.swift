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
        var currentScene: MainScene = .onboarding
        
        var isShowTabBar: Bool = true
        var isShareSheetPresented: Bool = false
        
        var feed: FeedStore.State = .init()
        var question: QuestionStore.State = .init()
        var myPage: MyPageStore.State = .init()
    }
    
    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case selectTab(MainScene)
        case showTabBar(Bool)
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
                switch scene {
                case .question:
                    state.isShowTabBar = false
                    
                default: break
                }
                state.currentScene = scene
                
                return .none
                
            case let .showTabBar(isShow):
                state.isShowTabBar = isShow
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
    }
}
