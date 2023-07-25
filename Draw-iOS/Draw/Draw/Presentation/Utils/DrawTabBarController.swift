//
//  DrawTabBarController.swift
//  Draw
//
//  Created by 송영모 on 2023/07/25.
//

import UIKit

import RxSwift
import RxCocoa

final class DrawTabBarController: BaseViewController {
    
    // MARK: - Properties
    
    private var feedViewController: UIViewController?
    private var questionViewController: UIViewController?
    private var myViewController: UIViewController?
    
    private var viewControllers: [UIViewController] = []
    
    // MARK: - UI Components
    
    private let tabBarView: UIView = .init()
    private let tabBarImageView: UIImageView = .init()
    private let buttonStackView: UIStackView = .init()
    private let feedTabButton: UIButton = .init()
    private let questionTabButton: UIButton = .init()
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
                $0.bottom.equalTo(questionTabButton.snp.top)
            }
        }
        
        guard let shouldFrontView = feedViewController.view else { return }
        view.bringSubviewToFront(shouldFrontView)
    }
    
    @objc func printLog() {
        print("clicked!")
    }
    // MARK: - View Lifecylce
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        tabBarImageView.image = .init(named: "ImgTabBar")
        
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        
        container.font = .systemFont(ofSize: 12, weight: .semibold)
        
        configuration.baseForegroundColor = .black
        configuration.titleAlignment = .center
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 15)
        configuration.imagePadding = 6
        configuration.imagePlacement = .top

        configuration.attributedTitle = AttributedString("Feed", attributes: container)
        configuration.image = UIImage(named: "IconFeed")
        feedTabButton.configuration = configuration
        
        configuration.attributedTitle = AttributedString("My", attributes: container)
        configuration.image = UIImage(named: "IconMy")
        myTabButton.configuration = configuration
        
        configuration.attributedTitle = .none
        configuration.image = UIImage(named: "ImgPlus")
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 31)
        questionTabButton.configuration = configuration
    }
    
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        self.view.addSubviews([tabBarView])
        tabBarView.addSubviews([tabBarImageView, buttonStackView, questionTabButton])
        
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
        
        tabBarImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        feedTabButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        
        myTabButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        
        questionTabButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    override func setupBind() {
        super.setupBind()
        
        feedTabButton.rx.tap
            .bind { state in
                print("feed")
            }
            .disposed(by: disposeBag)
        
        questionTabButton.rx.tap
            .subscribe(onNext: {
                print("q")
            })
            .disposed(by: disposeBag)
        
        myTabButton.rx.tap
            .subscribe(onNext: {
                print("my")
            })
            .disposed(by: disposeBag)
    }
}
