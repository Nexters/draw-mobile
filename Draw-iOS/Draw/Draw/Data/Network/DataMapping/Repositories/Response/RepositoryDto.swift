//
//  RepositoryDto.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

struct RepositoryDto: Decodable {
    let id: Int
    let owner: OwnerDto
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String?
}
