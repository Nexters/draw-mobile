//
//  TrendingRepositoriesRequestQuery.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

struct TrendingRepositoriesRequestQuery: Encodable {
    
    private enum CodingKeys : String, CodingKey {
        case query = "q"
    }
    
    let query = "language=+sort:stars"
}

