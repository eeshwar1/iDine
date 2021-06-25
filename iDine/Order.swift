//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    
    @Published var items = [MenuItem]()
    @Published var counts = [Int] ()

    var total : Int {
        
        if items.count > 0 {
            return items.reduce(0) { $0 + itemTotal(item: $1)}
        } else {
            return 0
        }
    }

    func itemTotal(item: MenuItem) -> Int {
        
        if let index = items.firstIndex(of: item) {
            
            return item.price * counts[index]
        } else {
            return 0
        }
        
    }
    
    func add(item: MenuItem) {
        
        if let index = items.firstIndex(of: item) {
            
            counts[index] += 1

        }
        else {
            
            items.append(item)
            counts.append(1)
        }
        
        
    }

    func remove(item: MenuItem) {
        
        if let index = items.firstIndex(of: item) {
            
            if counts[index] > 0 {
                
                counts[index] -= 1
                
                if counts[index] == 0 {
                    items.remove(at: index)
                    counts.remove(at: index)
                }
            }
            
            
        }
    }
    
    
}
