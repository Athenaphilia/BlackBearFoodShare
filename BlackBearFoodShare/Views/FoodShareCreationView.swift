//
//  FoodShareCreationView.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/7/25.
//
import SwiftUI

struct FoodShareCreationView: View {
    @EnvironmentObject var store: FoodshareStore
    @Environment(\.dismiss) var dismiss
    
    @State private var foodshareName: String = ""
    @State private var selectedBuilding: String = ""
    @State private var classroomNumber: String = ""
    @State private var descriptionText: String = ""
    @State private var foodRestrictions: [String] = []
    @State private var newRestriction: String = ""
    @State private var endTime: Date = Date()
    @State private var imageURL: String = ""

    let locator = BuildingLocator()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Basic Info")) {
                    TextField("Foodshare Name", text: $foodshareName)

                    TextField("Image URL", text: $imageURL)
                        .keyboardType(.URL)

                    DatePicker("Ends At", selection: $endTime, displayedComponents: .date)
                    DatePicker("", selection: $endTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }

                Section(header: Text("Location")) {
                    Picker("Building", selection: $selectedBuilding) {
                        ForEach(locator.allAliases(), id: \.self) { building in
                            Text(building)
                        }
                    }

                    TextField("Classroom Number", text: $classroomNumber)
                        .keyboardType(.numbersAndPunctuation)
                }

                Section(header: Text("Description")) {
                    TextEditor(text: $descriptionText)
                        .frame(minHeight: 100)
                }

                Section(header: Text("Food Restrictions")) {
                    HStack {
                        TextField("Add restriction", text: $newRestriction)
                        Button(action: addRestriction) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                        }
                    }

                    if foodRestrictions.isEmpty {
                        Text("No restrictions added")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(foodRestrictions, id: \.self) { r in
                            Text(r)
                        }
                        .onDelete(perform: deleteRestrictions)
                    }
                }

                Section {
                    Button(action: saveFoodshare) {
                        HStack {
                            Spacer()
                            Text("Save Foodshare")
                                .bold()
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("New Foodshare")
        }
    }


    private func addRestriction() {
        let trimmed = newRestriction.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        foodRestrictions.append(trimmed)
        newRestriction = ""
    }

    private func deleteRestrictions(at offsets: IndexSet) {
        foodRestrictions.remove(atOffsets: offsets)
    }

    private func saveFoodshare() {
            let item = FoodshareItem(
                name: foodshareName,
                endTime: endTime,
                description: descriptionText,
                foodRestrictions: foodRestrictions,
                imageURL: imageURL,
                building: selectedBuilding,
                classRoomNumber: classroomNumber
            )

            store.add(item)   // updates list automatically
            dismiss()         // closes the sheet
        }
}

#Preview {
    FoodShareCreationView()
}
