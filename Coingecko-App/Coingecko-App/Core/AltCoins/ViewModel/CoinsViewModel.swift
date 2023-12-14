//
//  CoinViewModel.swift
//  Coingecko-App
//
//  Created by Ibukunoluwa Akintobi on 14/12/2023.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice()
    }
    
    func fetchPrice() {
        self.coin = "Bitcoin"
        self.price = "$78,000"
    }
}
