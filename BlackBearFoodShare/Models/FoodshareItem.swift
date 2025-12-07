//
//  FoodshareItem.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/1/25.
//


import Foundation

struct FoodshareItem: Identifiable {
    let id = UUID()
    let name: String
    let endTime: Date
    let imageURL: String
    let location: String
}
