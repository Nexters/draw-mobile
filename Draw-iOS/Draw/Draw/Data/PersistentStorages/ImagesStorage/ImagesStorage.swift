//
//  ImagesStorage.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

protocol ImagesStorage {
    func getImageData(
        for urlPath: String,
        completion: @escaping (Result<Data?, Error>) -> Void
    )
    func save(imageData: Data, for urlPath: String)
}
