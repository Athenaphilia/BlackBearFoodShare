//
//  Item.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 11/24/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
