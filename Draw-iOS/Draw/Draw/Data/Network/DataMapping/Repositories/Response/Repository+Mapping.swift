//
//  Repository+Mapping.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

extension RepositoryDto {
    func toDomain() -> Repository {
        .init(
            id: id,
            owner: owner.toDomain(),
            name: name,
            description: description,
            stargazersCount: stargazersCount,
            language: language
        )
    }
}
