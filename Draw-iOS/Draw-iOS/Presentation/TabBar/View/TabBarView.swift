//
//  TabBarView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel: TabBarViewModel
    
    var body: some View {
        let feedView = FeedView(viewModel: self.viewModel.feedViewModel)
        let questionView = QuestionView(viewModel: self.viewModel.questionViewModel)
        let myPageView = MyPageView(viewModel: self.viewModel.myPageViewModel)
        
        ZStack {
            switch viewModel.currentTab {
            case .feed:
                feedView
            case .question: questionView
            case .myPage: myPageView
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
