//
//  HomeView.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import SwiftUI

struct HomeView: View {
    @State var users: [User] = [User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), User(name: "Bamba Diouf", image: "bambadiouf", username: "bambadiouf03"), User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), User(name: "William Wang", image: "williamwang", username: "willywonka04"), User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), User(name: "Nandini Gupta", image: "nandinigupta", username: "nandygupta"), User(name: "Priya Patel", image: "priyapatel", username: "priyapatell"), User(name: "Milan Dutta", image: "milandutta", username: "milandutta04"), User(name: "Colby Eagan", image: "colbyeagan", username: "colbyeagan03"), User(name: "Akhil Motiramani", image: "akhilmotiramani", username: "akhilmotiriamani")]
    @EnvironmentObject var paymentManager: PaymentManager
    @State var showing: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 1){
                        VStack(spacing: 0) {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("profilebackground"))
                                Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                            }
                            .frame(width: 50, height: 65)
                            Text("Search")
                                .font(.system(size: 13))
                        }
                        .frame(width: 70)
                        VStack(spacing: 0) {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("profilebackground"))
                                Image(systemName: "qrcode")
                                        .resizable()
                                        .scaledToFit()
                                    .frame(width: 25)
                            }
                            .frame(width: 50, height: 65)
                            Text("Scan")
                                .font(.system(size: 13))
                        }
                        .frame(width: 70)

                        ForEach($users, id: \.self) { user in
                            NavigationLink(destination: ProfileDetailView(user: user)){
                                ProfileView(user: user)
                            }
                            .buttonStyle(.plain)

                        }
                    }
                    .padding([.bottom, .trailing, .leading])
                }
                Spacer()
                ScrollView {
                    Image("venmohome")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing, 7)
                    VStack(alignment: .leading) {
                        ForEach(paymentManager.payments, id: \.self) { payment in
                                PaymentView(vm: PaymentViewModel(model: payment))
                        }
                    }
                }
            }
        }
    }
}

#Preview{
    HomeView()
}
