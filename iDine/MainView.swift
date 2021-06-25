//
//  MainView.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/13/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")

                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
            .environmentObject(Favorites())
    }
}
