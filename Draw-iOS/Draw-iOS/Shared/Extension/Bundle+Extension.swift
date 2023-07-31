//
//  Bundle+Extensions.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/30.
//

import Foundation

extension Bundle {
    var url: String {
        Bundle.main.infoDictionary?["SERVER_HOST"] as? String ?? ""
    }
}
