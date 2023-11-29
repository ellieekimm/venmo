//
//  QRCodeView.swift
//  venmo
//
//  Created by Ellie Kim on 11/28/23.
//

import SwiftUI

struct QRCodeView: View {
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .frame(width: 50)
                    .foregroundColor(Color("smallimagebackground"))
                Image(systemName: "qrcode")
                    .resizable()
                    .scaledToFit()
                .frame(width: 25)
            }
            VStack(alignment: .leading){
                Text("Scan or show QR code.")
                    .font(.system(size: 20))
                Text("Quickly pay or request money.")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
        }

    }
}

#Preview {
    QRCodeView()
}
