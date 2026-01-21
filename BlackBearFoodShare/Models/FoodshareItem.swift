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
    let description: String
    let foodRestrictions: Array<String>
    let imageURL: String
    let building: String
    let classRoomNumber: String
}
