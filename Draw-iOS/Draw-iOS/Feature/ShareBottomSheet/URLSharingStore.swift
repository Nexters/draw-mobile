//
//  ShareStore.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/10.
//

import Foundation
import ComposableArchitecture

struct URLSharingStore: Reducer {
    struct State: Equatable {
        let url: URL
    }
    
    enum Action: Equatable {
        case tmp
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tmp: return .none
            }
        }
    }
}
