//
//  FeedView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import SwiftUI

import ComposableArchitecture

struct FeedView: View {
    let store: StoreOf<FeedStore>
    
    var body: some View {
        WebView(url: .feed)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(store: .init(initialState: .init(), reducer: FeedStore()._printChanges()))
    }
}
