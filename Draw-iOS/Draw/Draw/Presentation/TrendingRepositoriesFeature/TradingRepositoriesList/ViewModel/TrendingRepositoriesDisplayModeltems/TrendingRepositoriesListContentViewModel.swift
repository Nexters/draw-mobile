//
//  TrendingRepositoriesListContentViewModel.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

enum TrendingRepositoriesListContentViewModel: Hashable {
    case items([TrendingRepositoriesListItemViewModel])
    case emptyData
    case loading
}
