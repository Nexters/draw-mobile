//
//  BaseViewController.swift
//  JYP-iOS
//
//  Created by 송영모 on 2022/07/17.
//  Copyright © 2022 JYP-iOS. All rights reserved.
//

import UIKit

import RxSwift
import SnapKit

/*
    BaseViewController
    - setupProperty()
        - 프로퍼티 관련 - label.font, ...
    - setupDelegate()
        - 델리게이트 패턴 관련 - tablView.delegate = self, ...
    - setupHierarchy()
        - 계층 관련 - addSubView, ...
    - setupLayout()
        - 레이아웃 관련 - view.snp.makeConstraints
    - setupBind()
        - 바인딩 관련 - button.rx.tap.bind
    - refreshTableView()
        - 테이블 뷰 높이 contentSize에 맞게 조정
*/

protocol BaseViewControllerProtocol: AnyObject {
    func setupProperty()
    func setupDelegate()
    func setupHierarchy()
    func setupLayout()
    func setupBind()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(hex: 0xF2F4F6)
        
        setupProperty()
        setupDelegate()
        setupHierarchy()
        setupLayout()
        setupBind()
    }

    func setupProperty() { }
    func setupDelegate() { }
    func setupHierarchy() { }
    func setupLayout() { }
    func setupBind() { }
}
