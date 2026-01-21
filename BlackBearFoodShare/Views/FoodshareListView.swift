//
//  FoodshareListView.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/1/25.
//

import SwiftUI

struct FoodshareListView: View {
    @EnvironmentObject var store: FoodshareStore
    @State private var showingCreate = false

    var body: some View {
        NavigationView {
            List(store.items) { item in
                NavigationLink(destination: FoodshareItemView(item: item)) {
                    FoodshareRow(item: item)
                }
            }
            .navigationTitle("Foodshare")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingCreate = true }) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingCreate) {
                FoodShareCreationView()
                    .environmentObject(store)
            }
        }
    }
}


#Preview {
    FoodshareListView().environmentObject(FoodshareStore())
}
