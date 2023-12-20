//
//  ContentView.swift
//  CoinGecko_Networking_API
//
//  Created by Eldar Gaiypov on 20/12/23.
//

import SwiftUI

struct ContentView: View {
    private enum Tab: Hashable {
        case chart
        case test
    }
    @State private var selectedTab: Tab = .chart
    var body: some View {
        TabView(selection: $selectedTab) {
        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
