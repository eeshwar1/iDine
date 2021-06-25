//
//  OrderView.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/13/21.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    
                    ForEach(order.items) { item in
                        
                    
                        VStack {
                            HStack {
                                Text("\(item.name)")
                                Spacer()
                                
                                if let itemIndex = order.items.firstIndex(of: item) {
                                    Button("-") {
                                        order.remove(item: item)
                                    }
                                    .font(.title)
                                    .buttonStyle(BorderlessButtonStyle())
                                    
                               Text("\(order.counts[itemIndex])")
                                   .font(.subheadline)
                                   .foregroundColor(Color.gray)
                                    
                                    Button("+") {
                                        order.add(item: item)               }
                                    .font(.title)
                                    .buttonStyle(BorderlessButtonStyle())
                                }

                                Spacer()
                                Text("$\(order.itemTotal(item: item))")
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
                Section {
                    
                    if !order.items.isEmpty {
                        HStack{
                            Text("Order Total: ")
                            Spacer()
                            Text("$\(order.total)")
                            .font(.headline)
                        }
                    }
                    
                    NavigationLink(
                        destination: CheckoutView()) {
                        Text("Place Order")
                        
                    }
                    .disabled(order.items.isEmpty)
                }
               
               
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        
            
        }
       
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        
        order.items.remove(atOffsets: offsets)
        order.counts.remove(atOffsets: offsets)
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
