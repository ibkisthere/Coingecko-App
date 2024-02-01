//
//  CoinViewModel.swift
//  Coingecko-App
//
//  Created by Ibukunoluwa Akintobi on 14/12/2023.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    
    private let service = CoinDataService()
    
    init() {
        fetchCoins()
    }
    // pass the data throug from the completion handler to a service
    func fetchCoins() {
        service.fetchCoins {
            coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
    
}
