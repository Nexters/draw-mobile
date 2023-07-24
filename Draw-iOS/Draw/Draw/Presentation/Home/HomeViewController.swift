//
//  HomeViewController.swift
//  Draw
//
//  Created by 송영모 on 2023/07/24.
//

import UIKit

import SnapKit

final class HomeViewController: UIViewController {
    private let titleLabel: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.text = "하이"
    }
}
