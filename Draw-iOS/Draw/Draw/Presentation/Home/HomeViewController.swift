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
    
    override func loadView() {
        self.view = webView
    }
    
    // MARK: - Setup Methods
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let url = URL(string: "https://draw-nexters.netlify.app/feed") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        webView.scrollView.isScrollEnabled = false
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
    }
    
    override func setupLayout() {
        super.setupLayout()
    }
}
