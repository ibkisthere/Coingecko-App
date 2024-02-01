//
//  CoinDataService.swift
//  Coingecko-App
//
//  Created by Ibukunoluwa Akintobi on 16/12/2023.
//

import Foundation

class CoinDataService {
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&sparkline=false&price_change_percentage=24h&locale=en"
    func fetchCoins(completion: @escaping([Coin]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with:url) { data, response, error in
            guard let data = data else { return }
//            let dataAsString = String(data:data, encoding: .utf8)
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
                print("DEBUG: Failed to decode coins")
                return
            }
            completion(coins)
            print("DEBUG: Coins decoded \(coins)")
//            print("DEBUG: Coin data \(dataAsString)")
        }.resume()
    }
    
    func fetchPrice(coin:String, completion : @escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG:FAILED WITH ERROR \(error.localizedDescription)")
//                    self.errorMessage = error.localizedDescription
            }
            guard let httpResponse = response as? HTTPURLResponse else {
//                    self.errorMessage = "Bad HTTP Response"
                return
            }
            guard httpResponse.statusCode == 200 else {
//                    self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
                return
            }
            
            print("Did receive data \(data)")
            guard let data = data else {return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {return}
            guard let value = jsonObject[coin] as? [String:Double] else {
                return
            }
            guard let price = value["usd"] else { return }
//                self.coin = coin.capitalized
//                self.price = "$\(price)"
            print("DEBUG:Price in service is \(price)")
            completion(price)
        }.resume()
    }
}
