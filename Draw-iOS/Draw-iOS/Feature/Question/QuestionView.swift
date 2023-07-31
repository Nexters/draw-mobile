//
//  QuestionView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import SwiftUI

import ComposableArchitecture

struct QuestionView: View {
    let store: StoreOf<QuestionStore>
    
    var body: some View {
        WebView(url: .newQuestion)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(store: .init(initialState: .init(), reducer: QuestionStore()._printChanges()))
    }
}
