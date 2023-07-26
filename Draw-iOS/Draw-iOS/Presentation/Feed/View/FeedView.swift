//
//  FeedView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel: FeedViewModel
    
    var body: some View {
        WebView(url: URL(string: "https://draw-nexters.netlify.app/feed")!)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: AppDIContainer().tabBarDependencies().feedViewModel)
    }
}
