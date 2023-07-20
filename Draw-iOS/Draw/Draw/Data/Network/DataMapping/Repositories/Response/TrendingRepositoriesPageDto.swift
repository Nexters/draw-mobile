//
//  TrendingRepositoriesPageDto.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

struct TrendingRepositoriesPageDto: Decodable {
    let items: [RepositoryDto]
}
