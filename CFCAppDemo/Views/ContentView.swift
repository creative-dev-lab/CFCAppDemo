//
//  ContentView.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var showingDemoView: Bool = false

    var body: some View {
        NavigationView {
            Button("Open Demo") {
                showingDemoView.toggle()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $showingDemoView) {
            FlightSearchView(showingDemoView: $showingDemoView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
