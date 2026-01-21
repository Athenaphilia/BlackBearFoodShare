//
//  SData.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/1/25.
//

import Foundation

var sampleFoodshareItems = [
    FoodshareItem(
        name: "Computer Science Club Pizza",
        endTime: Date().addingTimeInterval(3600),
        description: "Pizza and breadsticks",
        foodRestrictions: ["Vegetarian"],
        imageURL: "https://www.momsandmunchkins.ca/wp-content/uploads/2014/08/pizza-recipes-rockrecipes.jpg",
        building: "Neville Hall",
        classRoomNumber: "101"
    ),
    FoodshareItem(
        name: "Leftover Sandwiches",
        endTime: Date().addingTimeInterval(7200),
        description: "Ham and cheese sandwiches",
        foodRestrictions: [],
        imageURL: "https://www.indianhealthyrecipes.com/wp-content/uploads/2022/04/sandwich-recipes-swasthi.jpg",
        building: "DPC Hall",
        classRoomNumber: "107"
    ),
    FoodshareItem(
        name: "Extra Popcorn",
        endTime: Date().addingTimeInterval(5400),
        description: "Buttered and kettle corn",
        foodRestrictions: [],
        imageURL: "https://www.popcentralpopcorn.com/cdn/shop/products/partyfavorswebsitephoto2x2_73dbdfdc-97ee-4b2f-893f-cbca7aaf971b_1024x1024.png?v=1640023603",
        building: "Ferland Hall",
        classRoomNumber: "114"
    )
]
