//
//  FoodshareListView.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/1/25.
//


import SwiftUI

struct FoodshareListView: View {
    let items = sampleFoodshareItems
    
    var body: some View {
        NavigationView {
            List(items) { item in
                FoodshareRow(item: item)
            }
            .navigationTitle("Foodshare")
        }
    }
}
