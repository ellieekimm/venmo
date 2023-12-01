//
//  VenmoViewModel.swift
//  venmo
//
//  Created by Ellie Kim on 11/24/23.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @Published var userDisplay: [User] = []
    @Published var searchText: String = ""

    @Published var users: [User] = [User(name: "Bamba Diouf", image: "bambadiouf", username: "bambadiouf03"), User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), User(name: "William Wang", image: "williamwang", username: "willywonka04"), User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), User(name: "Nandini Gupta", image: "nandinigupta", username: "nandygupta"), User(name: "Priya Patel", image: "priyapatel", username: "priyapatell"), User(name: "Milan Dutta", image: "milandutta", username: "milandutta04"), User(name: "Colby Eagan", image: "colbyeagan", username: "colbyeagan03"), User(name: "Akhil Motiramani", image: "akhilmotiramani", username: "akhilmotiriamani")]
    
    @Published var topUsers: [User] = [User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), User(name: "William Wang", image: "williamwang", username: "willywonka04"), User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), User(name: "Colby Eagan", image: "colbyeagan", username: "colbyeagan03")]
    
    var searchResults: [User] {
        print("Entered property")
        if searchText.isEmpty {
            return users
        } else {
            print(users.filter { $0.name.contains(searchText) })
            return users.filter { $0.name.contains(searchText) }
        }
    }
    
}
class PaymentManager: ObservableObject {
    @Published var payments: [Payment] = [Payment(sender: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), receiver: User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), description: "for coffee ☕️", amount: -5.23, history: "3h", date: "Nov 24, 2023", privacy: false, likeCount: 5, time: "10:24 PM"), Payment(sender: User(name: "William Wang", image: "williamwang", username: "willywonka04"), receiver: User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), description: "joji tickets!!!", amount: 513, history: "10h", date: "Oct 25, 2023", privacy: true, likeCount: 10, time: "5:49 AM"), Payment(sender: User(name: "Bamba Diouf", image: "bambadiouf", username: "bambadiouf03"), receiver: User(name: "Sruthy Mammen", image: "sruthymammen", username: "sruthymammen"), description: "purr slay 💅🏻", amount: 103, history: "24h", date: "Jul 13, 2023", privacy: false, likeCount: 1000, time: "9:39 AM"),  Payment(sender: User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), receiver: User(name: "Milan Dutta", image: "milandutta", username: "milandutta04"), description: "PFTFTFTFT", amount: -8.75, history: "2h", date: "Nov 23, 2023", privacy: false, likeCount: 7, time: "12:35 PM"), Payment(sender: User(name: "Nandini Gupta", image: "nandinigupta", username: "nandygupta"), receiver: User(name: "Priya Patel", image: "akhilmotiramani", username: "akhilmotiriamani"), description: "electricity bill", amount: -15.50, history: "5h", date: "Nov 22, 2023", privacy: true, likeCount: 3, time: "8:15 PM"),
                                          
                                          
                                          Payment(sender: User(name: "Akhil Motiramani", image: "akhilmotiramani", username: "akhilmotiriamani"), receiver: User(name: "Bamba Diouf", image: "bambadiouf", username: "bambadiouf03"), description: "thanks queen", amount: -120.75, history: "2d", date: "Nov 19, 2023", privacy: false, likeCount: 8, time: "11:45 AM"),
                                                                                    
                                          Payment(sender: User(name: "Shreeya Kantamsetty", image: "shreeyakantamsetty", username: "shreeyakantamsetty"), receiver: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), description: "GREEK GYRO", amount: -20.00, history: "1d", date: "Nov 20, 2023", privacy: false, likeCount: 5, time: "2:30 PM"),
                                                                                    
                                          Payment(sender: User(name: "William Wang", image: "williamwang", username: "willywonka04"), receiver: User(name: "Colby Eagan", image: "colbyeagan", username: "colbyeagan"), description: "💩 💩 💩", amount: 35.50, history: "6h", date: "Nov 24, 2023", privacy: true, likeCount: 15, time: "9:10 AM"),
                                          
                                          Payment(sender: User(name: "Nandini Gupta", image: "nandinigupta", username: "nandinigupta"), receiver: User(name: "Ellie Kim", image: "elliekim", username: "elliekim"), description: "MATCHA🍵🍵", amount: 8.53, history: "6h", date: "Nov 24, 2023", privacy: true, likeCount: 15, time: "9:10 AM")]
                                              
    func addPayment(_ payment: Payment) {
        payments.append(payment)
    }
}


class PaymentViewModel: ObservableObject {
    
    var model: Payment

    init(model: Payment) {
        self.model = model
    }
    
    func checkSender() -> Bool {
        if (model.sender.name == "Ellie Kim"){
            return true
        }
        return false
    }
    
    func amountColor() -> Color {
        if (model.amount > 0){
            return Color.green
        }
        else{
            return Color.red
        }
    }
    
    func imageToShow() -> String {
        if (model.sender.name == "Ellie Kim"){
            return "elliekim"
        }
        else {
            return model.sender.image
        }
    }
    
    func senderName() -> String {
        if (model.sender.name == "Ellie Kim"){
            return "You"
        }
        else {
            return model.sender.name
        }
    }
    func showPrice() -> Bool {
        if (model.sender.name == "Ellie Kim"){
            return true
        }
        else {
            return false
        }
    }
    
    func formatAmount() -> String {
        if (showPrice()) {
            if (model.amount >= 0){
                return String(format: "$%.2f", model.amount)
            }
            else{
                return String(format: "-$%.2f", abs(model.amount))
            }
        }
        else{
            return ""
        }
    }
    
    func publicImage() -> String {
        if (model.privacy) {
            return "person.2.fill"
        }
        else{
            return "globe.americas.fill"
        }
    }
    
    func commentPrivacy() -> String {
        if (model.privacy) {
            return "Friends"
        }
        else {
            return "Global"
        }
    }
    
    func historyImageToShow() -> String {
        if (model.receiver.name == "Ellie Kim"){
            return model.sender.image
        }
        else{
            return model.receiver.image
        }
        return ""
    }
    
    
    func historyShowPrice() -> Bool {
        if (model.sender.name == "Ellie Kim" || model.receiver.name == "Ellie Kim"){
            return true
        }
        return false
    }
    
    func historyFormatAmount() -> String {
        if (historyShowPrice()) {
            if (model.sender.name == "Ellie Kim"){
                return "- $\(abs(model.amount))"
            }
            else{
                return "+ $\(abs(model.amount))"
            }
        }
        return ""
    }
    
    func historyNameToShow() -> String {
        if (model.receiver.name == "Ellie Kim"){
            return model.sender.name
        }
        else{
            return model.receiver.name
        }
    }
    
    func historyFormatColor() -> Color {
        if (model.receiver.name == "Ellie Kim"){
            return Color.green
        }
        else{
            return Color.red
        }
    }
}


