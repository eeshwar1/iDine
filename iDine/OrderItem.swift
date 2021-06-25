//
//  OrderItem.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/19/21.
//

import Foundation
import SwiftUI

class OrderItem : ObservableObject, Identifiable {
    
    var id: UUID
    
    @Published var menuItem: MenuItem
    @Published var count: Int
    
    init(item: MenuItem) {
        
        self.id = UUID()
        self.menuItem = item
        count = 1
    }
    
    var total: Int {
        
        if self.count > 0 {
            return menuItem.price * count
        } else {
            return 0
        }
    }

    func add() {
        
        objectWillChange.send()
        print("add item")
        self.count += 1
        print("\(self.count)")
     
    }

    func remove() {
    
        objectWillChange.send()
        print("remove item")
        self.count -= 1
        print("\(self.count)")
    }
}
    

