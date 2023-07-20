//
//  ImagesRequestQuery.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

struct ImagesRequestQuery: Encodable {
    
    private enum CodingKeys : String, CodingKey {
        case size = "s"
    }
    
    let size: Int
}
