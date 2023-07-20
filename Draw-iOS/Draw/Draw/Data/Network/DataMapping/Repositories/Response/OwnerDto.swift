//
//  OwnerDto.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

struct OwnerDto: Decodable {
    let id: Int
    let login: String
    let avatarUrl: String
}
