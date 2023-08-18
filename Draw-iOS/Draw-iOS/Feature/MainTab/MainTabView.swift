//
//  MainTabView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import SwiftUI

import ComposableArchitecture

struct MainTabView: View {
    @Environment(\.openURL) private var openURL
    
    let store: StoreOf<MainTabViewStore>
    
    let showBottomBarPublisher = NotificationCenter.default.publisher(for: .showBottomBar)
    let showShareSheetPublisher = NotificationCenter.default.publisher(for: .showShareSheet)
    let openURLPublisher = NotificationCenter.default.publisher(for: .openURL)
    let fcmTokenPublisher = NotificationCenter.default.publisher(for: .fcmToken)
    
    let webView = WebView(url: .onboarding)
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                webView
                
                if viewStore.isShowTabBar {
                    tabBarView(viewStore: viewStore)
                }
            }
            .onOpenURL { url in
                if let urlString = url.valueOf("link"), let url = URL(string: urlString) {
                    webView.update(url: url)
                } else {
                    webView.update(url: url)
                }
            }
            .onChange(of: viewStore.currentScene) { scene in
                webView.send(type: .navigate(scene)) { _, errorOrNil in
                    if let error = errorOrNil {
                        print(error)
                    }
                }
            }
            .onReceive(showBottomBarPublisher) { value in
                if let isShow = value.userInfo?[NotificationKey.showBottomBar] as? Bool {
                    viewStore.send(.showTabBar(isShow))
                }
            }
            .onReceive(showShareSheetPublisher) { value in
                if let urlString = value.userInfo?[NotificationKey.showShareSheet] as? String, let url = URL(string: urlString) {
                    viewStore.send(.shareURL(url: url))
                }
            }
            .onReceive(openURLPublisher) { value in
                if let urlString = value.userInfo?[NotificationKey.openURL] as? String, let url = URL(string: urlString) {
                    webView.update(url: url)
                }
            }
            .onReceive(fcmTokenPublisher) { value in
                if let token = value.userInfo?[NotificationKey.fcmToken] as? String {
                    webView.send(type: .fcmToken(token)) { _, errorOrNil in
                        if let error = errorOrNil {
                            print(error)
                        }
                    }
                }
            }
            .sheet(store: self.store.scope(state: \.$urlSharing, action: { .urlSharing($0) })) { store in
                if #available(iOS 16.0, *) {
                    store.withState({
                        URLSharingView(url: $0.url)
                            .presentationDetents([.medium])
                    })
                } else {
                    store.withState({
                        URLSharingView(url: $0.url)
                    })
                }
            }
            .background(Color("ColorBackgroundWhite"))
            .ignoresSafeArea()
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
                        Image(viewStore.state.currentScene == .feed ? "ImgFeed" : "ImgFeedInactive")
                            .resizable()
                            .foregroundColor(viewStore.state.currentScene == .feed ? Color("TextBlack") : Color("TextGrey2"))
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
                        Image(viewStore.state.currentScene == .myPage ? "ImgMyPage" : "ImgMyPageInactive")
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
