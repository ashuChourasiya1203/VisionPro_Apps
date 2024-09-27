//
//  SafariView.swift
//  Apple_Framework_App
//
//  Created by Ashutosh Chourasiya on 07/03/24.
//

import SwiftUI
import SafariServices

struct SafariView : UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    let url : URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController  {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
}
