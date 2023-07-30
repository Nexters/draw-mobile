//
//  FeedStore.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import ComposableArchitecture

struct FeedStore: ReducerProtocol {
    struct State: Equatable { }
    
    enum Action: Equatable {
        case tmp
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .tmp: return .none
            }
        }
    }
}
