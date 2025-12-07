//
//  SData.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/1/25.
//

import Foundation
import SwiftUI
internal import Combine

let sampleFoodshareItems = [
    FoodshareItem(
        name: "Food Example 1",
        endTime: Date().addingTimeInterval(3600),
        imageURL: "https://picsum.photos/id/112/200",
        location: "Williams"
    ),
    FoodshareItem(
        name: "Food Example 2",
        endTime: Date().addingTimeInterval(7200),
        imageURL: "https://picsum.photos/id/169/200",
        location: "Williams"
    ),
    FoodshareItem(
        name: "Food Example 3",
        endTime: Date().addingTimeInterval(5400),
        imageURL: "https://picsum.photos/id/189/200",
        location: "Williams"
    ),
    FoodshareItem(
        name: "Pizza",
        endTime: Date().addingTimeInterval(5400),
        imageURL: "https://i.imgur.com/e08nJV7.jpeg",
        location: "Williams"
    )
]
class SData: ObservableObject {
    @Published var foodshareItems: [FoodshareItem] = sampleFoodshareItems
}
