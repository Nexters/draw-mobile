//
//  OwnerDto+Mapping.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

extension OwnerDto {
    func toDomain() -> Owner {
        return .init(
            id: id,
            name: login,
            avatarUrl: avatarUrl
        )
    }
}
