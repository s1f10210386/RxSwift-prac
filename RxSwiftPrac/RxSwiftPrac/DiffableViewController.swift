//
//  ToDoViewController.swift
//  RxSwiftPrac
//
//  Created by 金澤帆高 on 2025/05/23.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class DiffableViewController: UIViewController {
    // MARK: - Dependency
    typealias Dependency = any DiffableViewModelType

    // MARK: - Properties
    private let viewModel: Dependency
    private let environment: any EnvironmentProvider
    private let disposeBag = DisposeBag()

    // MARK: - Initialize
    init(dependency: Dependency, environment: any EnvironmentProvider) {
        self.viewModel = dependency
        self.environment = environment
        super.init(nibName: Self.className, bundle: Self.bundle)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
    }
}

// MARK: - Binding
private extension DiffableViewController {
    func bind(to viewModel: Dependency) {
        // binding process
    }
}

// MARK: - ViewControllerInstantiable
extension DiffableViewController: ViewControllerInstantiable {}
