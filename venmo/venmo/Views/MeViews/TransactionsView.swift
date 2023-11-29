//
//  TransactionsView.swift
//  venmo
//
//  Created by Ellie Kim on 11/27/23.
//

import SwiftUI

struct TransactionsView: View {
    var payments: [Payment] = [Payment(sender: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), receiver: User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), description: "decomposing", amount: -5.23, history: "3h", date: "Nov 24, 2023", privacy: false, likeCount: 5, time: "10:24 PM"), Payment(sender: User(name: "William Wang", image: "williamwang", username: "willywonka04"), receiver: User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), description: "feet pics <3", amount: 513, history: "10h", date: "Oct 25, 2023", privacy: true, likeCount: 10, time: "5:49 AM"), Payment(sender: User(name: "Bamba Diouf", image: "bambadiouf", username: "bambadiouf03"), receiver: User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), description: "purr slay", amount: 103, history: "24h", date: "Jul 13, 2023", privacy: false, likeCount: 1000, time: "9:39 AM"),  Payment(sender: User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), receiver: User(name: "Milan Dutta", image: "milandutta", username: "milandutta04"), description: "coffee", amount: -8.75, history: "2h", date: "Nov 23, 2023", privacy: false, likeCount: 7, time: "12:35 PM")]
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HStack {
                    Circle()
                        .foregroundColor(Color("venmoblue"))
                        .frame(width: 60)
                        .overlay(
                            Image(systemName: "building.columns")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .foregroundColor(Color.white)
                        )
                        .offset(y: -5)
                    
                    VStack(alignment: .leading, spacing: 7) {
                        HStack {
                            Text("Standard transfer")
                                .font(.system(size: 15))
                                .bold()
                            Spacer()
                            Text("$85")
                                .font(.system(size: 15))
                                .foregroundColor(Color.gray)
                                .fontWeight(.bold)
                        }
                        
                        HStack(spacing: 5) {
                            Text("Nov 25")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 15))
                            Image(systemName: "lock.fill")
                                .foregroundColor(Color.gray)
                        }
                        
                        Text("Estimated to arrive on November 28")
                            .font(.system(size: 15))
                            .foregroundColor(Color.gray)
                            .fontWeight(.regular)
                            .padding(.top, 3)
                        
                        Divider()
                    }
                }
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Completed")
                            .font(.headline)
                        Text("2023")
                            .font(.system(size: 25))
                            .padding(.top, 2)
                    }
                    .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding()
                
                ForEach(payments) { payment in
                    if payment.sender.name == "Ellie Kim" || payment.receiver.name == "Ellie Kim" {
                        HistoryView(vm: PaymentViewModel(model: payment))
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    TransactionsView()
}
