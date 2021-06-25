//
//  OrderView.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/13/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: Favorites
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    
                    ForEach(favorites.items) { item in
                        
                        VStack {
                        HStack {
                            Text(item.name)
                                .font(.body)
                            Spacer()
                            Button("Order this") {
                                order.add(item: item)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .font(.body)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                        }
                        
                        HStack {
                            Text("Unit Price: $\(item.price)")
                                .font(.caption2)
                            Spacer()
                        }
                    }
                    }
                    .onDelete(perform:deleteItems)
                    
                }
                
            }
            .navigationTitle("Favorites")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        
            
        }
       
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(Favorites())
    }
}
