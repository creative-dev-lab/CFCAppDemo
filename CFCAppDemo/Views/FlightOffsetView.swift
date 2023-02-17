//
//  FlightOffsetView.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct FlightOffsetView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("GrassyKnollSheet")
                    .resizable()
                    .aspectRatio(geo.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct FlightOffsetView_Previews: PreviewProvider {
    static var previews: some View {
        FlightOffsetView()
    }
}
