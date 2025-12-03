//
// Assignment #15
// Stephen David
// Date: 2025-12-02
//


import SwiftUI

struct ContentView: View {
    @State private var groceries = [
        "Organic Bananas",
        "Cold Brew Coffee",
        "Whole Wheat Bread",
        "Almond Milk",
        "Free-Range Eggs"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groceries, id: \.self) { item in
                    Text(item)
                        .contextMenu {
                            Button {
                                print("Added \(item) to cart")
                            } label: {
                                Label("Add to Cart", systemImage: "cart")
                            }
                            
                            Button {
                                print("Added \(item) to wishlist")
                            } label: {
                                Label("Add to Wishlist", systemImage: "heart")
                            }
                            
                            Button(role: .destructive) {
                                deleteItem(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Grocery List")
        }
    }
    
    private func deleteItem(_ item: String) {
        if let index = groceries.firstIndex(of: item) {
            groceries.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
