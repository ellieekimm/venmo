//
//  ProfileView.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: User
    var body: some View {
        VStack(spacing: 0){
            Image(user.image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 50, height: 65)
                .foregroundColor(Color.black)

            Text(user.name)
                .font(.system(size: 13))
                .frame(width: 70)
                .lineLimit(1)
                .truncationMode(.tail)
                .foregroundColor(Color.black)

            
        }
        .frame(width: 70)
    }
}


