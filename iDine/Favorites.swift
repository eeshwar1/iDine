//
//  Favorites.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/18/21.
//

import SwiftUI

class Favorites: ObservableObject {
    
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        
        if items.contains(item) {
            return
        }
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
