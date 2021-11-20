//
//  SafariView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 06/11/21.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {

    var url: URL?

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url ?? URL(string: "https://enigma.ieeevit.org")!)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
