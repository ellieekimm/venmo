//
//  PaymentView.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import SwiftUI

struct PaymentView: View {
    @StateObject var vm: PaymentViewModel
    @State var comments: [String] = []
    @State var isLiked: Bool = false
    @State var likedOnce: Bool = false
    var body: some View {
        
        NavigationStack {
            HStack(spacing: 15) {
                Image(vm.imageToShow())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .offset(y: -15)
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 7) {
                        VStack(alignment: .leading){
                            HStack {
                                Text(vm.senderName())
                                    .font(.system(size: 15))
                                + Text(" paid ")
                                    .font(.system(size: 15))
                                + Text(vm.model.receiver.name)
                                    .font(.system(size: 15))
                                    .bold()
                                Text(vm.formatAmount())
                                    .font(.system(size: 15))
                                    .foregroundColor(vm.amountColor())
                                    .fontWeight(.bold)
                            }
                            HStack(spacing: 5){
                                Text(vm.model.history)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 15))
                                Image(systemName: vm.publicImage())
                                    .foregroundColor(Color.gray)
                            }
                        }
                        Text(vm.model.description)
                            .font(.system(size: 15))
                            .padding(.bottom, 7)
                        HStack(spacing: 15){
                            HStack(spacing: 3) {
                                Button(action: {
                                    if (!likedOnce){
                                        vm.model.likeCount += 1
                                        likedOnce = true
                                    }
                                    if (isLiked){
                                        vm.model.likeCount -= 1
                                        likedOnce = false
                                    }
                                    isLiked.toggle()
                                    print(vm.model.likeCount)
                                }, label: {
                                    if (isLiked){
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 17)
                                            .foregroundColor(Color.red)
                                    }
                                    else{
                                        Image(systemName: "heart")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 17)
                                            .foregroundColor(Color.gray)
                                    }
                                })
                                Text("\(vm.model.likeCount)")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 13))
                            }
                            NavigationLink(destination: CommentView(vm: vm, comments: $comments)
){
                                Image(systemName: "message")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 17)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundColor(Color.gray)
                                .padding(.trailing, 5)
                        }
                        .padding(.bottom, 10)
                        Divider()
                    }
                }
            }
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 5)
        }
    }
}

#Preview {
    PaymentView(vm: PaymentViewModel(model: Payment(sender: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), receiver: User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), description: "gas money af", amount: 5.23, history: "3h", date: "Nov 24", privacy: false, likeCount: 5, time: "10:29 PM")))
}
