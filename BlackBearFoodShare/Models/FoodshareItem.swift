import Foundation

struct FoodshareItem: Identifiable {
    let id = UUID()
    let name: String
    let endTime: Date
    let imageURL: String
}
