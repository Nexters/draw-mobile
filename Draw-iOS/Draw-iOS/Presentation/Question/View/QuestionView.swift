//
//  QuestionView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

struct QuestionView: View {
    @StateObject var viewModel: QuestionViewModel
    
    var body: some View {
        WebView(url: .newQuestion)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewModel: .init())
    }
}
