//
//  TrendingRepositoriesPageDto+Mapping.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

extension TrendingRepositoriesPageDto {
    func toDomain() -> TrendingRepositoriesPage {
        .init(
            items: items.map { $0.toDomain() }
        )
    }
}
