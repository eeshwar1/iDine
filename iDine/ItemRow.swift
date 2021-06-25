//
//  ItemRow.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/13/21.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    
    let colors: [String: Color] = ["D": .purple,
                                  "G": .black,
                                  "N": .red,
                                  "S": .blue,
                                  "V": .green]
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            
            VStack(alignment: .leading) {

                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) {
                restricton in
                Text(restricton)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restricton, default: .black])
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
