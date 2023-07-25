//
//  HomeViewController.swift
//  Draw
//
//  Created by 송영모 on 2023/07/24.
//

import UIKit
import WebKit

import SnapKit

final class HomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let webView: WKWebView = .init()
    
    // MARK: - View Lifecylce
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let url = URL(string: "https://draw-nexters.netlify.app/feed") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // MARK: - Setup Methods
    
    override func setupProperty() {
        super.setupProperty()
        
        view.backgroundColor = .init(hex: 0xF2F4F6)
        
        webView.scrollView.isScrollEnabled = false
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        view.addSubviews([webView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
