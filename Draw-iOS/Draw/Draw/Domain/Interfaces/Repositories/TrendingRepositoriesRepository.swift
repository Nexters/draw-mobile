//
//  TrendingRepositoriesRepository.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

protocol TrendingRepositoriesRepository {
    @discardableResult
    func fetchTrendingRepositoriesList(
        cached: @escaping (TrendingRepositoriesPage) -> Void,
        completion: @escaping (Result<TrendingRepositoriesPage, Error>) -> Void
    ) -> Cancellable?
}
