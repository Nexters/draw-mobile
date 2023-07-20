//
//  ImagesRepository.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

protocol ImagesRepository {
    func fetchImage(
        with imagePath: String,
        size: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> Cancellable?
}
