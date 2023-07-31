//
//  MyPageView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import SwiftUI

import ComposableArchitecture

struct MyPageView: View {
    let store: StoreOf<MyPageStore>
    
    var body: some View {
        WebView(url: .myPage)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(store: .init(initialState: .init(), reducer: MyPageStore()._printChanges()))
    }
}
