//
//  ProfileDetailView.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import SwiftUI
import Swift

struct ProfileDetailView: View {
    @State var amountFloat: Float = 0.0
    @State var description: String = ""
    @State var amountString: String = ""
    @Binding var user: User
    @EnvironmentObject var paymentManager: PaymentManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Image(user.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .clipShape(Circle())
            Text(user.name)
            HStack() {
                               Text("$")
                TextField("", value: $amountFloat, format: .number)
                                   .font(.largeTitle)
                       }
                       .padding(.leading, 170)
            HStack {
                TextField("What's this for?", text: $description)
            }
            .padding(15)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("smallimagebackground"), lineWidth: 1))
            .padding()
            HStack{
                Button(action: {
                    let payment: Payment = Payment(sender: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), receiver: user, description: description, amount: amountFloat , history: "1m", date: "Nov 29", privacy: false, likeCount: 0, time: "12:05 PM")
                    paymentManager.payments.append(payment)
                    dismiss()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 150, height: 50)
                            .foregroundColor(Color("venmoblue"))
                        Text("Request")
                            .underline()
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                    }
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color("venmoblue"))
                            .frame(width: 150, height: 50)
                        Button(action: {
                            let payment: Payment = Payment(sender: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), receiver: user, description: description, amount: -amountFloat , history: "1m", date: "Nov 29", privacy: false, likeCount: 0, time: "12:05 PM")
                            paymentManager.payments.append(payment)
                            dismiss()
                        }, label: {
                            Text("Pay")
                                .underline()
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        })
                    }
                })
            }
        }
    }
}


