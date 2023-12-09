//
//  ContentView.swift
//  MyOkashi
//
//  Created by 持田晴生 on 2023/05/01.
//

import SwiftUI

struct ContentView: View {
    //OkashiDataを参照する状態変数
     @StateObject var okashiDataList =  OkashiData()
    @State var inputText  = ""
    
    var body: some View {
        VStack{
            //文字を受け取るTextFieldを表示する
            TextField("キーワード",
                      text: $inputText,
                      prompt: Text("キーワードを入力してください"))
            .onSubmit {
                //入力完了直後に検索をする
                okashiDataList.searchOkashi(keyword: inputText)
            }
            //キーボードの改行を検索に変更する
            .submitLabel(.search)
            //上下左右に空白をあける
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
