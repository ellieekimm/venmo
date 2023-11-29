//
//  NavBar2.swift
//  venmo
//
//  Created by Ellie Kim on 11/29/23.
//

import SwiftUI

struct NavBar2: View {
    var body: some View {
        HStack (alignment: .bottom){
            Spacer()
            Button(action: {
                HomeView()
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
                        .font(.subheadline)
                        .foregroundColor(Color("venmoblue"))
                        .font(.system(size: 15))
                }
            })
            .frame(width: 50)
            Spacer()
            Button(action: {
                PayRequestView()
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
                MeView2()
            }, label: {
                VStack{
                    Image("elliekim")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke())
                    Text("Me")
                        .underline()
                        .font(.subheadline)
                        .font(.system(size: 15))
                        .foregroundColor(Color("venmoblue"))
                }
            })
            .frame(width: 50)
            Spacer()
        }
        .padding([.leading, .trailing])
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.white, lineWidth: 1) // Add a border around the HStack
                .shadow(color: Color.black.opacity(0.9), radius: 11, x: 3, y: -20) // Add shadow to the border
        )

    }
    

}

#Preview {
    NavBar2()
}
