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
        MainView()
                .tag(0)
                .tabItem {
                    Text("Top 100")
                    Image(systemName: "bitcoin.circle")
                }
//        NewsView()
//                .tag(1)
//                .tabItem {
//                    Text("News")
//                    Image(systemName: "newspaper")
//                }
//        ExchagesView()
//                .tag(2)
//                .tabItem {
//                    Text("Exchages")
//                    Image(systemName: "bag.fill")
//                }
//        About()
//                .tag(3)
//                .tabItem {
//                    Text("About")
//                    Image(systemName: "questionmark.app")
//                }
        }
    }
}

#Preview {
    ContentView()
}

struct MainView: View {
    @State var data = [Main]()
    var body: some View {
        NavigationView {
            VStack {
                List(data, id: \.self) { item in
                    NavigationLink(destination: CoinDetailedData(coin: item)) {
                        HStack {
                            Text("\(item.marketCapRank ?? 0)")
                                .font(.headline)
                            AsyncImage(url: URL(string: "\(item.image ?? "")")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                                .frame(width: 20, height: 20)
                            if item.marketCapRank ?? 0 == 1 {
                                Text("👑 \(item.name ?? "") 👑")
                                    .font(.headline)
                            } else {
                                Text("\(item.name ?? "")")
                                    .font(.headline)
                            }

                            Spacer()
                            Text("$\(item.currentPrice ?? 0, specifier: "%.2f")")
                        }
                    }
                }
                    .listStyle(.insetGrouped)

            }
                .navigationTitle("Top 100 by Market Cap")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)

                .toolbar {
                Button(action: {

                    APICall().getAPI { (data) in
                        self.data = data
                    }
                }) {
                    Text("Reload")
                }
            }
        }
            .onAppear() {
            APICall().getAPI { (data) in
                self.data = data
            }
        }
    }
}

