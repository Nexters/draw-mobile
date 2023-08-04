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
    
    let showBottomBarPublisher = NotificationCenter.default.publisher(for: .showBottomBar)
    let showShareSheetPublisher = NotificationCenter.default.publisher(for: .showShareSheet)
    
    let webView = WebView(url: URL(string: "https://deploy-preview-31--draw-nexters.netlify.app/")!)
    
    var body: some View {
        
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                webView
                
                tabBarView(viewStore: viewStore)
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
            .sheet(
              isPresented: viewStore.binding(
                get: \.isShareSheetPresented,
                send: MainTabViewStore.Action.setShareSheet(isPresented:)
              )
            ) {
                ActivityViewController(url: .feedDetail)
                    .presentationDetents([.medium])
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
