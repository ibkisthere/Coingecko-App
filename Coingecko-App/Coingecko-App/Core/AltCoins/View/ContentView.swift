//
//  ContentView.swift
//  Coingecko-App
//
//  Created by Ibukunoluwa Akintobi on 14/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    var body: some View {
        VStack {
            Text("\(viewModel.price) \(viewModel.coin)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
