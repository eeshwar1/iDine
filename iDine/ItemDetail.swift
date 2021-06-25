//
//  ItemDetail.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/13/21.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
            
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                
                
            }
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .padding()
            .font(.headline)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button(action: {
                
                    favorites.add(item: item)
                }) {
                    
                    Image(systemName: "star")
                }
            }
        }
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
