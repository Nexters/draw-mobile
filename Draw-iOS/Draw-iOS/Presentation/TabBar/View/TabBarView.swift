//
//  TabBarView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel: TabBarViewModel
    
    let feedView = FeedView(viewModel: .init())
    let questionView = QuestionView(viewModel: .init())
    let myPageView = MyPageView(viewModel: .init())
    
    var body: some View {
        ZStack {
            feedView.opacity(1)
            questionView.opacity(1)
            myPageView.opacity(1)
            
            switch viewModel.currentTab {
            case .feed: feedView.opacity(1)
            case .question: questionView.opacity(1)
            case .myPage: myPageView.opacity(1)
            }
            
            tabBarView()
        }
        .background(Color("ColorBackgroundWhite"))
        .ignoresSafeArea()
    }
    
    private func tabBarView() -> some View {
        ZStack {
            VStack {
                Spacer()
                
                Image("ImgTabBar")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 80)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.currentTab = .feed
                    }, label: {
                        Image("ImgFeed")
                            .resizable()
                    })
                    .frame(width: 50, height: 50)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.currentTab = .myPage
                    }, label: {
                        Image("ImgMyPage")
                            .resizable()
                    })
                    .frame(width: 50, height: 50)
                    
                    Spacer()
                }
                .padding()
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    self.viewModel.currentTab = .question
                }, label: {
                    Image("ImgPlus")
                        .resizable()
                })
                .frame(width: 100, height: 100)
            }
            .padding(.bottom, 24)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: AppDIContainer().tabBarDependencies())
    }
}
