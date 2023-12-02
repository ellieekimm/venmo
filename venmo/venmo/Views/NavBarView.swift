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
    @State var colorHomeView: Bool = true
    @State var colorPayView: Bool = false
    @State var colorMeView: Bool = false
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
                MeViewFix()
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
                    colorHomeView = true
                    colorPayView = false
                    colorMeView = false
                }, label: {
                    VStack{
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(colorHomeView ? Color("selectedcolor") :
                                Color("venmoblue"))
                            .frame(width: 25)
                        Text("Home")
                            .underline()
                            .fontWeight(.bold)
                            .foregroundColor(colorHomeView ? Color("selectedcolor") :
                                Color("venmoblue"))                          .font(.system(size: 15))
                    }
                })
                .buttonStyle(.plain)
                .frame(width: 50)
                Spacer()
                Button(action: {
                    viewShowing = 2
                    colorHomeView = false
                    colorPayView = true
                    colorMeView = false
                }, label: {
                    VStack {
                        Image("venmoimage")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(colorPayView ? Color("selectedcolor") :
                                                Color("venmoblue"))
                            .frame(width: 35)
                        Text("Pay/Request")
                            .underline()
                            .font(.headline)
                            .foregroundColor(colorPayView ? Color("selectedcolor") :
                                                Color("venmoblue"))
                    }
                })
                .frame(width: 150)
                .buttonStyle(.plain)

                Spacer()
                Button(action: {
                    viewShowing = 3
                    colorHomeView = false
                    colorPayView = false
                    colorMeView = true
                }, label: {
                    VStack{
                        Image("elliekim")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundColor(colorMeView ? Color("selectedcolor") :
                                Color("venmoblue"))
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke())
                        Text("Me")
                            .underline()
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .foregroundColor(colorMeView ? Color("selectedcolor") :
                                Color("venmoblue"))                      }
                })
                .frame(width: 50)
                Spacer()
            }
            .buttonStyle(.plain)
            .padding([.leading, .trailing])
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.white, lineWidth: 1) // Add a border around the HStack
                    .shadow(color: Color.black.opacity(0.9), radius: 11, x: 3, y: -20) // Add shadow to the border
            )
        }
    }
}

#Preview {
    NavBarView()
}
