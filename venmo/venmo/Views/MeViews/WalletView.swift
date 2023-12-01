//
//  WalletView.swift
//  venmo
//
//  Created by Ellie Kim on 11/25/23.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("In Venmo")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                HStack {
                    Text("$")
                        .fontWeight(.medium)
                    + Text("65")
                        .fontWeight(.semibold)
                        .font(.system(size: 45))
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("venmoblue"))
                            .frame(width: 120, height: 40)
                        Text("Transfer")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .underline()
                    }
                }
                Text("Banks and cards")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                ScrollView(.horizontal) {
                    HStack {
                        VStack(alignment: .leading){
                            Image("visaimage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 10,
                                        topTrailingRadius: 10
                                    )
                                )
                                Text("Fidelity Investments")
                                    .foregroundColor(Color.black)
                                    .fontWeight(.semibold)
                                    .padding(.leading, 10)
                                Text("Debit")
                                    .padding(.leading, 10)
                            HStack{
                                Image(systemName: "ellipsis")
                                    .padding(.top, 10)
                                    .padding(.leading, 10)
                                    .padding(.bottom, 10)
                                Text("2222")
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                            }
                            .foregroundColor(Color.gray)
                            .font(.headline)
                        }
                        .frame(width: 140)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("profilebackground"), lineWidth: 1)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)

                    )
                        VStack(alignment: .leading){
                            Image("boaimage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 10,
                                        topTrailingRadius: 10
                                    )
                                )
                                Text("Bank of America")
                                    .foregroundColor(Color.black)
                                    .fontWeight(.semibold)
                                    .padding(.leading, 10)
                                Text("Bank")
                                    .padding(.leading, 10)
                            HStack{
                                Image(systemName: "ellipsis")
                                    .padding(.top, 10)
                                    .padding(.leading, 10)
                                    .padding(.bottom, 10)
                                Text("1111")
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                            }
                            .foregroundColor(Color.gray)
                            .font(.headline)
                        }
                        .frame(width: 130)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("profilebackground"), lineWidth: 1)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)

                    )

                        VStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(Color("profilebackground"))
                                    .frame(width: 60)
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                            }
                            .padding(.top, 25)
                                Text("Add a bank or card")
                                    .foregroundColor(Color("venmoblue"))
                                    .fontWeight(.heavy)
                                    .frame(width: 120)
                                    .padding(.top, 25)
                        }
                        .frame(width: 130, height: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("profilebackground"), lineWidth: 1)
                    )
                    }
                }
            }
            .padding([.leading, .trailing, .top])
        }
    }
}

#Preview {
    WalletView()
}
