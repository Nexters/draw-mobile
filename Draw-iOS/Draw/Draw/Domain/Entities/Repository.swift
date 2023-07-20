//
//  Repository.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

struct Repository: Equatable {
    let id: Int
    let owner: Owner
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String?
}
