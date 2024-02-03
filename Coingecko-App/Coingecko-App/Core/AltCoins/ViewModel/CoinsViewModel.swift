//
//  CoinViewModel.swift
//  Coingecko-App
//
//  Created by Ibukunoluwa Akintobi on 14/12/2023.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage:String?
    
    private let service = CoinDataService()
    
    init() {
        fetchCoins()
    }
    // pass the data through from the completion handler to a service
    func fetchCoins() {
//        service.fetchCoins {
//            coins, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.errorMessage = error.localizedDescription
//                    return
//                }
//                self.coins = coins ?? []
//            }
//        }
        service.fetchCoins {
            result in
            switch result {
            case .success(let coins):
                self.coins = coins
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
