//
//  DiffableViewModel.swift
//  RxSwiftPrac
//
//  Created by 金澤帆高 on 2025/05/23.
//

import Foundation

protocol DiffableViewModelInput: AnyObject {
}

protocol DiffableViewModelOutput: AnyObject {
}

protocol DiffableViewModelType: AnyObject {
    var inputs: any DiffableViewModelInput { get }
    var outputs: any DiffableViewModelOutput { get }
}

final class DiffableViewModel: DiffableViewModelType {
    // MARK: - Inputs Sources
    // MARK: - Outputs Sources
    // MARK: - Properties
    var inputs: any DiffableViewModelInput { return self }
    var outputs: any DiffableViewModelOutput { return self }
}

// MARK: - PamphletViewModelInput
extension DiffableViewModel: DiffableViewModelInput {}

// MARK: - PamphletViewModelOutput
extension DiffableViewModel: DiffableViewModelOutput {}
