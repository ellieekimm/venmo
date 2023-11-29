//
//  PeopleView.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import SwiftUI

struct PeopleView: View {
    @Binding var user: User
    var body: some View {
        HStack(spacing: 7){
            Image(user.image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 60, height: 70)
            VStack(alignment: .leading, spacing: 5){
                Text(user.name)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)

                Text("@\(user.username)")
                    .font(.system(size: 13))
                    .foregroundColor(Color.gray)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
            }
            
        }
    }
}

