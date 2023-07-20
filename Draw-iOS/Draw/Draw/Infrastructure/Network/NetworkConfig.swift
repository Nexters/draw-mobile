//
//  NetworkConfig.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import Foundation

protocol NetworkConfigurable {
    var baseURL: URL? { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}

struct ApiDataNetworkConfig: NetworkConfigurable {
    let baseURL: URL?
    let headers: [String: String]
    let queryParameters: [String: String]
    
    init(
        baseURL: URL? = nil,
        headers: [String: String] = [:],
        queryParameters: [String: String] = [:]
    ) {
        self.baseURL = baseURL
        self.headers = headers
        self.queryParameters = queryParameters
    }
}

