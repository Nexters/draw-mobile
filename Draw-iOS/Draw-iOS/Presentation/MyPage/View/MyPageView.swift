//
//  MyPageView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    
    var body: some View {
        WebView(url: .myPage)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(viewModel: .init())
    }
}
