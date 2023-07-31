//
//  RootStore.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import Foundation

import ComposableArchitecture

struct RootStore: ReducerProtocol {

    enum State: Equatable {
        case mainTab(MainTabViewStore.State)
        
        init() {
            self = .mainTab(.init())
        }
    }
    
    enum Action: Equatable {
        case mainTab(MainTabViewStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {

        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
        
        .ifCaseLet(/State.mainTab, action: /Action.mainTab) {
            MainTabViewStore()
        }
    }
}
