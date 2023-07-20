//
//  RepositoryTask.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
