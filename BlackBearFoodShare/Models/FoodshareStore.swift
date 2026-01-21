//
//  FoodshareStore.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/7/25.
//


import SwiftUI
import Combine

class FoodshareStore: ObservableObject {
    @Published var items: [FoodshareItem] = sampleFoodshareItems

    func add(_ item: FoodshareItem) {
        items.append(item)
    }
}
