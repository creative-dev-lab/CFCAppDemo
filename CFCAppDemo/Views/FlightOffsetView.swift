//
//  FlightOffsetView.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct FlightOffsetView: View {
    @Binding var path: [Routes]

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("GrassyKnollSheet")
                    .resizable()
                    .aspectRatio(geo.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                Image("tree")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 5)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)

                VStack {
                    Text("Your Flight's Impact")
                        .foregroundColor(Color("primary"))
                        .font(.title)
                        .padding(24)

                    Spacer()

                    HStack {
                        Image("ic_plane")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("primary"))
                            .frame(width: 16, height: 16)
                            .padding(.horizontal, 10)

                        Text("New york (JFK) to Paris (CDG)")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16))
                            .padding(.trailing, 10)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Capsule().fill(Color("surface")))
                    .padding(.horizontal, 20)

                    VStack {
                        Text("10")
                            .foregroundColor(Color("secondary"))
                            .font(.title)
                            .padding(.bottom, 16)

                        Text("Kg C02 Emitted")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16))
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("surface"), lineWidth: 2)
                    )
                    .padding(.top, 16)
                    .padding(.horizontal, 20)

                    Button(action: {
                        path.removeAll()
                    }, label: {
                        HStack {
                            Text("Start Over")
                                .tint(Color("primary"))
                                .font(.system(size: 16))

                            Image("ic_next")
                                .resizable()
                                .scaledToFit()
                                .tint(Color("primary"))
                                .frame(width: 24, height: 24)
                        }
                    })
                    .frame(width: 130, height: 40, alignment: .center)
                    .background(Color("surface"))
                    .cornerRadius(20)
                    .shadow(color: Color("primary"), radius: 3)
                    .padding(.top, 80)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct FlightOffsetView_Previews: PreviewProvider {
    static var previews: some View {
        FlightOffsetView(path: .constant([.flightOffset]))
    }
}
