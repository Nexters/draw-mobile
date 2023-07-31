//
//  ActivityViewController.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/31.
//

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: [url], applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
