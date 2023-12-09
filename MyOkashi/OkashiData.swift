//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 持田晴生 on 2023/12/08.
//

import Foundation

 //お菓子データ検索用クラス
class OkashiData: ObservableObject{
    //JSONのデータ構造
    struct ResultJson: Codable{
        //JSONのitem内のデータ構造
        struct Item: Codable{
            //お菓子の名称
            let name: String?
            //掲載URL
            let url: URL?
            //画像URL
            let image:URL?
        }
        //複数要素
        let item: [Item]?
    }
    
    //WebAPI検索用メソッド　第一引数:keyword 検索したいワード
    func searchOkashi(keyword : String){
        //デバッグエリアに出力
        print("searchOakshiメソッドで受け取った値:\(keyword)")
        
        //Taskは非同期で処理を実行できる
        Task{
            //ここから先は非同期で処理される
            //非同期でお菓子を検索する
            await search(keyword: keyword)
        }
    }
    
    private func search(keyword: String)async{
        //お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters:
                .urlQueryAllowed)
        else{
            return
        }
        
        //リクエストURLの組み立て
        guard let req_url = URL(string:"https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else{
            return
        }
        //デバッグエリアに出力
        print(req_url)
        
        do{
            //リクエストURLからダウンロード
            let (data , _) = try await URLSession.shared.data(from: req_url)
            // JSONDecoderのインスタンス取得
            let decoder = JSONDecoder()
            //受け取ったJSONデータをパース(解析)して格納
            let json = try decoder.decode(ResultJson.self, from: data)
            
            print(json)
            
        }catch{
            //エラー処理
            print("エラーが出ました")
        }
    }
}
