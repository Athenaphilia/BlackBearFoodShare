//
//  CreateFoodshare.swift
//  BlackBearFoodShare
//
//  Created by Wesley Dumas on 12/7/25.
//

import SwiftUI

struct CreateFoodshare: View {
    @ObservedObject var data: SData
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var location: String = ""
    @State private var food: String = ""
    @State private var url: String = ""
    @State private var endtime: String = ""

    var body: some View {
        VStack{
            Text("Creating Foodshare")
            Form {
                TextField(text: $name, prompt: Text("Enter Name")) {
                    Text("Name")
                }
                TextField(text: $food, prompt: Text("Enter Food")) {
                    Text("Food")
                }
                TextField(text: $location, prompt: Text("Enter Location")) {
                    Text("Location")
                }
                TextField(text: $url, prompt: Text("Enter Image Url")) {
                    Text("URL")
                }
                TextField(text: $endtime, prompt: Text("Enter End Time in HH:MM")) {
                    Text("End Time")
                }.keyboardType(.numberPad)
            }
            Button("Submit") {
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"
                let endTimeFormatted = formatter.date(from: endtime)! // needs error checking
                let newFoodshare = FoodshareItem(name: name, endTime: endTimeFormatted, imageURL: url, location: location)
                data.foodshareItems.append(newFoodshare)
                dismiss() // go back to the FoodshareListView screen
            }
        }
    }
}

#Preview {
    CreateFoodshare(data: SData())
}
