//
//  HistoryView.swift
//  venmo
//
//  Created by Ellie Kim on 11/27/23.
//

import SwiftUI

struct HistoryView: View {
    var vm: PaymentViewModel = PaymentViewModel(model:Payment(sender: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), receiver: User(name: "William Wang", image: "williamwang", username: "willywonka04"), description: "decomposing", amount: 10.98, history: "3h", date: "Nov 24, 2023", privacy: false, likeCount: 5, time: "10:29 PM"))
    var body: some View {
        HStack(spacing: 15) {
                Image(vm.historyImageToShow())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .offset(y: -9)
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 7) {
                        VStack(alignment: .leading){
                            HStack {
                                Text(vm.historyNameToShow())
                                    .font(.system(size: 15))
                                    .bold()
                                Spacer()
                                Text(vm.historyFormatAmount())
                                    .font(.system(size: 15))
                                    .foregroundColor(vm.historyFormatColor())
                                    .fontWeight(.bold)
                            }
                            HStack(spacing: 5){
                                Text(vm.model.date)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 15))
                                Image(systemName: vm.publicImage())
                                    .foregroundColor(Color.gray)
                            }
                        }
                        .padding(.bottom, 20)
                        Divider()
                    }
                }
            }
                .padding([.leading, .trailing])
            .padding([.top, .bottom], 5)
    }
}

#Preview {
    HistoryView()
}
