//
//  SafariView.swift
//  MyOkashi
//
//  Created by 持田晴生 on 2023/12/10.
//

import SwiftUI
import SafariServices

// SFSafariViewControllerを起動する構造体
struct SafariView: UIViewControllerRepresentable{
    //表示するホームページのURLを受け取る変数
    let url: URL
    
    //表示するViewを生成するときに実行
    func makeUIViewController(context: Context) -> SFSafariViewController {
        //Safariを起動
        return SFSafariViewController(url: url)
    }
    
    //Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        //処置なし
    }
}
