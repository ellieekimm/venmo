//
//  TabView.swift
//  venmo
//
//  Created by Ellie Kim on 11/27/23.
//

import SwiftUI

struct SlidingView: View {
    var body: some View {
        
        TabView {
            WalletView()
                .tabItem {
                    Text("Wallet")
                }

           TransactionsView()
                .tabItem {
                    Text("Transactions")
                }

        }
    }
}

#Preview {
    SlidingView()
}
