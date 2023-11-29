//
//  PayRequestView.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import SwiftUI

struct PayRequestView: View {
    @State var textField: String = ""
    @State var users: [User] = [User(name: "Bamba Diouf", image: "bambadiouf", username: "bambadiouf03"), User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), User(name: "William Wang", image: "williamwang", username: "willywonka04"), User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), User(name: "Nandini Gupta", image: "nandinigupta", username: "nandygupta"), User(name: "Priya Patel", image: "priyapatel", username: "priyapatell"), User(name: "Milan Dutta", image: "milandutta", username: "milandutta04"), User(name: "Colby Eagan", image: "colbyeagan", username: "colbyeagan03"), User(name: "Akhil Motiramani", image: "akhilmotiramani", username: "akhilmotiriamani")]
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image("venmoimage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        TextField("Name, @username, email, phone", text: $textField)
                    }
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("smallimagebackground"), lineWidth: 1))
                    QRCodeView()
                    Text("Friends")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    HStack {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading) {
                                ForEach($users, id: \.self){ user in                              
                                    NavigationLink(destination: ProfileDetailView(user: user)) {
                                        PeopleView(user: user)
                                }  }
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding(.leading, 20)
        }
    }
}



