//
//  CommentView.swift
//  venmo
//
//  Created by Ellie Kim on 11/25/23.
//

import SwiftUI

struct CommentView: View {
    var vm: PaymentViewModel
    @Binding var comments: [String]
    @State var comment: String = ""
    @State private var updateCounter = 0 // Use a @State property to trigger updates


    var body: some View {
        VStack {
            HStack(spacing: 15) {
                    Image(vm.imageToShow())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .clipShape(Circle())
                        .offset(y: -20)
                    VStack {
                        VStack(alignment: .leading){
                            HStack {
                                Text(vm.senderName())
                                    .font(.system(size: 15))
                                + Text(" charged ")
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
                                Text(vm.model.date)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 13))
                                + Text(" at ")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 13))
                                + Text(vm.model.time)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 13))
                                Image(systemName: vm.publicImage())
                                    .foregroundColor(Color.gray)
                                Text(vm.commentPrivacy())
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 13))
                            }
                            .padding([.bottom], 10)
                            Text(vm.model.description)
                            Divider()
                        }
                    }
                    }
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 5)
            ForEach(comments, id: \.self){ comment in
                HStack(spacing: 15) {
                        Image("elliekim")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .clipShape(Circle())
                            .offset(y: -20)
                    VStack(alignment: .leading, spacing: 5){
                        Text("You")
                            .font(.system(size: 15))
                        Text("Now")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                        Text(comment)
                            .font(.system(size: 15))
                            .padding([.bottom], 10)
                        Divider()
                        }
                    }
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 10)
            }
            Spacer()
            HStack {
                TextField("Write a comment", text: $comment)
                Button {
                    comments.append(comment)
                    comment = ""
                } label: {
                    Text("Send")
                        .foregroundColor(Color.blue)
                }
            }
            .padding()    
        }
        }
}


