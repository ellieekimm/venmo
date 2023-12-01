//
//  MeViewFix.swift
//  venmo
//
//  Created by Ellie Kim on 12/1/23.
//

import SwiftUI

struct MeViewFix: View {
    @State var walletView: Bool = true
    @State var view: String = ""
    @State var views: [String] = ["Wallet", "Transactions"]
    @EnvironmentObject var paymentManager: PaymentManager
    var body: some View {
        VStack {
            ZStack {
                Ellipse()
                    .fill(.blue)
                    .frame(width: 500, height: 250)
                    .offset(y: -100)
                VStack {
                        HStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 8){
                                Text("Ellie Kim")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 25))
                                Text("@Ellie-Kim-30")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15))
                                
                            }
                            Spacer()
                            Spacer()
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
                            Spacer()
                            
                        }
                        .padding()
                    ZStack {
                        Image("elliekim")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 4))
                            .offset(y: -10)
                        ZStack {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(Color("smallimagebackground"))
                            Image(systemName: "qrcode")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 25)
                        }
                        .offset(x: 40, y: 22)
                    }
                    }
                Spacer()
            }
        }
        VStack {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width: 125, height: 80)
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
                        .frame(width: 120, height: 80)
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
        }
        .padding(.bottom, 10)
        VStack {
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
              .environmentObject(paymentManager)
      }
    }
}



#Preview {
    MeViewFix()
}
