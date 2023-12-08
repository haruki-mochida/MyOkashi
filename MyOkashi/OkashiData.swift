//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 持田晴生 on 2023/12/08.
//

import Foundation

 //お菓子データ検索用クラス
class Okashi: ObservableObject{
    //WebAPI検索用メソッド　第一引数:keyword 検索したいワード
    func searchOkashi(keyword : String){
        //デバッグエリアに出力
        print("searchOakshiメソッドで受け取った値:\(keyword)")
    }
}
