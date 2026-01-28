//
//  FoodshareItemView.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/3/25.
//

import SwiftUI

struct FoodshareItemView: View {
    let item: FoodshareItem
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .none // Changed to none if you only care about time, or .medium for both
        df.timeStyle = .short
        return df
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // IMAGE HANDLING
                AsyncImage(url: URL(string: item.imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Color.gray.opacity(0.1)
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity, minHeight: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, minHeight: 300)
                            .clipped()
                    case .failure:
                        ZStack {
                            Color.gray.opacity(0.3)
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, minHeight: 300)
                    @unknown default:
                        EmptyView()
                    }
                }

                // TEXT CONTENT
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Title and Description
                    Text(item.name)
                        .font(.largeTitle)
                        .bold()
                    
                    if !item.description.isEmpty {
                        Text(item.description)
                            .font(.body)
                    }

                    Divider()

                    // Restrictions
                    if !item.foodRestrictions.isEmpty {
                        Text("Dietary Notes:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                        
                        FlowLayoutShim(items: item.foodRestrictions)
                    }
                    
                    Divider()

                    // Location and Time Info
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: "clock")
                            Text("Ends at \(dateFormatter.string(from: item.endTime))")
                        }
                        
                        HStack {
                            Image(systemName: "building.2")
                            // FIXED: accessing building and classRoomNumber instead of location
                            Text("\(item.building), Room \(item.classRoomNumber)")
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// Helper to display tags cleanly (Optional, improves UI for restrictions)
struct FlowLayoutShim: View {
    let items: [String]
    var body: some View {
        HStack {
            ForEach(items, id: \.self) { restriction in
                HStack(spacing: 4) {
                    Image(systemName: "checkmark.circle.fill")
                    Text(restriction)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.green.opacity(0.1))
                .foregroundColor(.green)
                .cornerRadius(8)
            }
        }
    }
}

#Preview {
    FoodshareItemView(item: sampleFoodshareItems[0])
}
