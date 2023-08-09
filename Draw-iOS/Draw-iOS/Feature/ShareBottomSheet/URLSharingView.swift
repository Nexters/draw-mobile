//
//  SharingView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/10.
//

import SwiftUI

import ComposableArchitecture

struct URLSharingView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: [url], applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
