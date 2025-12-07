//
//  FoodshareListView.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/1/25.
//


import SwiftUI

struct FoodshareListView: View {
    @StateObject var data = SData()
    let items = sampleFoodshareItems
    
    var body: some View {
        NavigationStack {
            VStack{
                List(data.foodshareItems) { item in
                    NavigationLink(destination: FoodshareItemView(item: item)) {
                        FoodshareRow(item: item)
                    }
                }
                .navigationTitle("Foodshare")
                
                NavigationLink("Create foodshare") {
                    CreateFoodshare(data: data)
                }
            }
        }
    }
}
