//
//  MeView2.swift
//  venmo
//
//  Created by Ellie Kim on 11/27/23.
//

import SwiftUI

struct MeView2: View {
    @State var walletView: Bool = true
    @State var view: String = ""
    @State var views: [String] = ["Wallet", "Transactions"]
    var body: some View {
        ZStack {
            Ellipse()
                .fill(.blue)
                .frame(width: 500, height: 250)
                .offset(y: -150)
            VStack {
                    VStack{
                        HStack {
                            VStack(alignment: .leading, spacing: 8){
                                Text("Ellie Kim")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 25))
                                    .offset(x: 70)
                                    .offset(y: -10)
                                Text("@Ellie-Kim-30")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15))
                                    .offset(x: 70)
                                    .offset(y: -10)

                            }
                            Spacer()
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 40)
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18)
                                    .foregroundColor(Color("venmoblue"))
                            }
                            .offset(x: -60)
                            .offset(y: -20)

                            
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 40)
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18)
                                    .foregroundColor(Color("venmoblue"))
                            }
                            .offset(x: -60)
                            .offset(y: -20)

                        }
                        .padding()
                        Image("elliekim")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color.white, lineWidth: 4))
                            .offset(y: -30)
                }
                Spacer()
            }
        }
        VStack {
            HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 125, height: 75)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("profilebackground"), lineWidth: 1)
                            )
                        VStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("venmoblue"))
                                    .frame(width: 33)
                                Image(systemName: "person.3.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .frame(width: 20)
                            }
                            Text("Create a group")
                                .foregroundColor(Color("venmoblue"))
                                .fontWeight(.heavy)
                                .font(.system(size: 15))
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 125, height: 75)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("profilebackground"), lineWidth: 1)
                            )
                        VStack {
                            HStack{
                                Image("sruthymammen")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 30)
                                    .offset(x: 16)
                                Image("shreeyakantamsetty")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 30)
                                Image("williamwang")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 30)
                                    .offset(x: -17)
                            }
                            Text("102 friends")
                                .foregroundColor(Color("venmoblue"))
                                .fontWeight(.heavy)
                                .font(.system(size: 15))
                        }
                    }
            }
            .offset(y: -110)
        }
        VStack {
            VStack{
                    Picker("View", selection: $view){
                        ForEach(views, id: \.self) {view in
                            Text(view)
                        }
                    }
                    .padding([.leading, .trailing], 10)
                    .pickerStyle(.segmented)
                }
            if (view == "Wallet") {
                WalletView()
            }
            else{
                TransactionsView()
            }
        }
        .offset(y: -100)

        }
}

#Preview{
    MeView2()
}
