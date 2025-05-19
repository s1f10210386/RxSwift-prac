//
//  RootViewController.swift
//  RxSwiftPrac
//
//  Created by 金澤帆高 on 2025/05/08.
//

import UIKit
import RxSwift
import RxCocoa

class RootViewController: UIViewController {
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var errorLabel: UILabel!
    @IBOutlet private var registerButton: UIButton! {
        didSet { registerButton.isEnabled = false }
    }
    
    let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.rx.text.orEmpty.bind(to: viewModel.title).disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.content).disposed(by: disposeBag)
        viewModel.isNextButtonEnabled
            .drive(registerButton.rx.isEnabled)
//            .drive(onNext: { [weak self] isEnabled in
//                self?.okButton.isEnabled = isEnabled
//            })
            .disposed(by: disposeBag)
        viewModel.isErrorLabelHidden
            .drive(errorLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }
}

final class HomeViewModel {
    // MARK: - Inputs Sources
    let title : PublishRelay<String> = .init()
    let content : PublishRelay<String> = .init()
    // MARK: - Outputs Sources
    let isNextButtonEnabled: Driver<Bool>
    let isErrorLabelHidden: Driver<Bool>
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialize
    init() {
        
        let observable = Observable.combineLatest(title, content)
            .map {title, content in
                !title.isEmpty && !content.isEmpty
            }
            .distinctUntilChanged()
            .share(replay: 1)
        
        isNextButtonEnabled = observable.asDriver(onErrorDriveWith: .empty())
        
        isErrorLabelHidden = observable
            .startWith(true)
            .asDriver(onErrorDriveWith: .empty())
    }
}
