//
//  CreateFoodshare.swift
//  BlackBearFoodShare
//
//  Created by Wesley Dumas on 12/7/25.
//

import SwiftUI

import SwiftUI

struct CreateFoodshare: View {
    // Assuming SData is a class you have defined elsewhere
    @ObservedObject var data: SData
    @Environment(\.dismiss) private var dismiss
    
    // Updated state variables to match FoodshareItem struct
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var building: String = ""
    @State private var classRoomNumber: String = ""
    @State private var imageURL: String = ""
    @State private var restrictionsString: String = "" // To handle comma-separated input
    @State private var endTime: Date = Date()

    var body: some View {
        NavigationView { // Added NavigationView for better form styling
            Form {
                Section(header: Text("Details")) {
                    TextField("Title (e.g. Free Pizza)", text: $name)
                    
                    TextField("Description", text: $description)
                    
                    TextField("Image URL", text: $imageURL)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("Location")) {
                    TextField("Building Name", text: $building)
                    TextField("Room Number", text: $classRoomNumber)
                }
                
                Section(header: Text("Details")) {
                    // Split string by comma to create the array
                    TextField("Dietary Tags (comma separated)", text: $restrictionsString)
                    
                    // Replaced String input with actual DatePicker
                    DatePicker("End Time", selection: $endTime, displayedComponents: [.hourAndMinute])
                }
                
                Button("Submit") {
                    createAndDismiss()
                }
                .disabled(name.isEmpty || building.isEmpty) // Basic validation
            }
            .navigationTitle("New Foodshare")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
    
    func createAndDismiss() {
        // Convert comma separated string to Array<String>
        let restrictionsArray = restrictionsString
            .components(separatedBy: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        let newFoodshare = FoodshareItem(
            name: name,
            endTime: endTime,
            description: description,
            foodRestrictions: restrictionsArray,
            imageURL: imageURL,
            building: building,
            classRoomNumber: classRoomNumber
        )
        
        data.foodshareItems.append(newFoodshare)
        dismiss()
    }
}
#Preview {
    CreateFoodshare(data: SData())
}
