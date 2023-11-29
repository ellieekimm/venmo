//
//  NavBarView.swift
//  venmo
//
//  Created by Ellie Kim on 11/28/23.
//

import SwiftUI

struct NavBarView: View {
    @StateObject var paymentManager: PaymentManager = PaymentManager()
    @State var viewShowing: Int = 1
    var body: some View {
            VStack {
                switch (viewShowing){
                case 1:
                    HomeView()
                        .environmentObject(paymentManager)
                case 2:
                    PayRequestView()
                        .environmentObject(paymentManager)
                case 3:
                    MeView2()
                        .environmentObject(paymentManager)
                default:
                    HomeView()
                        .environmentObject(paymentManager)
                }
                Spacer()
                HStack (alignment: .bottom){
                    Spacer()
                    Button(action: {
                        viewShowing = 1
                    }, label: {
                        VStack{
                            Image(systemName: "house.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color("venmoblue"))
                                .foregroundColor(Color.pink)
                                .frame(width: 25)
                            Text("Home")
                                .underline()
                                .foregroundColor(Color("venmoblue"))
                                .font(.system(size: 15))
                        }
                    })
                    .frame(width: 50)
                    Spacer()
                    Button(action: {
                        viewShowing = 2
                    }, label: {
                        VStack {
                            Image("venmoimage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                            Text("Pay/Request")
                                .underline()
                                .font(.headline)
                            .foregroundColor(Color("venmoblue"))
                        }
                    })
                    .frame(width: 150)
                    Spacer()
                    Button(action: {
                        viewShowing = 3
                    }, label: {
                        VStack{
                            Image("elliekim")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .clipShape(Circle())
                            Text("Me")
                                .underline()
                                .font(.system(size: 15))
                                .foregroundColor(Color("venmoblue"))
                        }
                    })
                    .frame(width: 50)
                    Spacer()
                }
                .padding([.leading, .trailing])
            }
        }
}

#Preview {
    NavBarView()
}
