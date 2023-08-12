//
//  MainTabStore.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import Foundation

import ComposableArchitecture

struct MainTabViewStore: Reducer {

    struct State: Equatable {
        @PresentationState var urlSharing: URLSharingStore.State?
        
        var currentScene: MainScene = .onboarding
        
        var isShowTabBar: Bool = false
        var shareUrl: String?
    }
    
    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case urlSharing(PresentationAction<URLSharingStore.Action>)
        
        case selectTab(MainScene)
        case showTabBar(Bool)
        
        case shareURL(url: URL)
        
        case setShareSheet(isPresented: Bool)
    }
    
    public var body: some Reducer<State, Action> {
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
        
        .ifLet(\.$urlSharing, action: /Action.urlSharing) {
            URLSharingStore()
        }
    }
}
