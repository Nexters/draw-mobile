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
    
    override func setupProperty() {
        super.setupProperty()
        
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
    }
    
    override func setupLayout() {
        super.setupLayout()
    }
}
