//
//  iDineApp.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/12/21.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    @StateObject var favorites = Favorites()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favorites)
        }
    }
}
