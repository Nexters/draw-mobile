//
//  MainTabView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import SwiftUI

import ComposableArchitecture

struct MainTabView: View {
    let store: StoreOf<MainTabViewStore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                tabView(viewStore: viewStore)
                
                tabBarView(viewStore: viewStore)
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    private func tabView(viewStore: ViewStoreOf<MainTabViewStore>) -> some View {
        switch viewStore.state.currentScene {
        case .feed:
            FeedView(store: self.store.scope(state: \.feed, action: { .feed($0) }))
        case .question:
            QuestionView(store: self.store.scope(state: \.question, action: { .question($0) }))
        case .myPage:
            MyPageView(store: self.store.scope(state: \.myPage, action: { .myPage($0) }))
        }
    }
    
    private func tabBarView(viewStore: ViewStoreOf<MainTabViewStore>) -> some View {
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
                        viewStore.send(.selectTab(.feed))
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
                        viewStore.send(.selectTab(.myPage))
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
                    viewStore.send(.selectTab(.question))
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(store: .init(initialState: .init(), reducer: MainTabViewStore()._printChanges()))
    }
}
