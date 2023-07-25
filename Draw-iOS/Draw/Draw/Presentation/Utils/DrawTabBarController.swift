//
//  DrawTabBarController.swift
//  Draw
//
//  Created by 송영모 on 2023/07/25.
//

import UIKit

final class DrawTabBarController: BaseViewController {
    
    // MARK: - Properties
    
    private var feedViewController: UIViewController?
    private var questionViewController: UIViewController?
    private var myViewController: UIViewController?
    
    private var viewControllers: [UIViewController] = []
    
    // MARK: - UI Components
    
    private let tabBarView: UIView = .init()
    private let buttonStackView: UIStackView = .init()
    private let feedTabButton: UIButton = .init()
    private let myTabButton: UIButton = .init()
    
    public func setViewControllers(
        feedViewController: UIViewController,
        questionViewController: UIViewController,
        myViewController: UIViewController
    ) {
        self.feedViewController = feedViewController
        self.questionViewController = questionViewController
        self.myViewController = myViewController
        
        viewControllers.append(contentsOf: [feedViewController, questionViewController, myViewController])
        
        viewControllers.forEach { viewController in
            addChild(viewController)
            view.addSubview(viewController.view)
            viewController.didMove(toParent: self)
            
            viewController.view.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(tabBarView.snp.top)
            }
        }
        
        guard let shouldFrontView = feedViewController.view else { return }
        view.bringSubviewToFront(shouldFrontView)
    }
    
    // MARK: - View Lifecylce
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        
        feedTabButton.setTitle("Feed", for: .normal)
        feedTabButton.setTitleColor(.black, for: .normal)
        
        myTabButton.setTitle("My", for: .normal)
        myTabButton.setTitleColor(.black, for: .normal)
    }
    
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        self.view.addSubviews([tabBarView])
        tabBarView.addSubviews([buttonStackView])
        
        buttonStackView.addArrangedSubview(feedTabButton)
        buttonStackView.addArrangedSubview(.init(frame: .init(x: 0, y: 0, width: 50, height: 50)))
        buttonStackView.addArrangedSubview(myTabButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        tabBarView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        feedTabButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
        
        myTabButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
    }
}
