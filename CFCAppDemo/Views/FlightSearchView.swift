//
//  FlightSearchView.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import SwiftUI

struct FlightSearchView: View {
    @Binding var showingDemoView: Bool
    @StateObject private var flightSearchVM = FlightSearchViewModel()
    @State private var path: [Routes] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                Button(action: {
                    showingDemoView = false
                }, label: {
                    HStack {
                        Image("ic_back")
                            .resizable()
                            .scaledToFit()
                            .tint(Color("primary"))
                            .frame(width: 16, height: 16)

                        Text("Back")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16))
                    }
                })
                .frame(width: 100, height: 40, alignment: .center)
                .background(Color("surface"))
                .cornerRadius(20)
                .shadow(color: Color("primary"), radius: 3)
                .disabled(false)
                .padding(20)

                HStack {
                    Image("ic_plane")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("primary"))
                        .frame(width: 20, height: 20)

                    Text("Flight")
                        .foregroundColor(Color("secondary"))
                        .font(.system(size: 24))
                }
                .padding(.horizontal, 20)

                Text("Enter the origin and final destination for you flight and we’ll make your flight Carbon-Neutral with Offsets")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 13))
                    .padding(.horizontal, 20)

                HStack {
                    Image("ic_search")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("primary"))
                        .frame(width: 16, height: 16)
                        .padding(.trailing, 10)

                    TextField(
                        "From (Location)",
                        text: $flightSearchVM.fromLocation,
                        onEditingChanged: { editingChanged in
                        flightSearchVM.isFromLocationEditing = editingChanged
                    })
                        .tint(Color("primary"))
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 16))
                        .padding(.trailing, 10)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                }
                .padding(20)
                .background(Capsule().fill(Color("surface")))
                .shadow(radius: 3)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(
                            Color("primary"),
                            lineWidth: flightSearchVM.isFromLocationEditing ? 2 : 0)
                )
                .padding(.horizontal, 20)
                .padding(.top, 24)

                HStack {
                    Image("ic_search")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("primary"))
                        .frame(width: 16, height: 16)
                        .padding(.trailing, 10)

                    TextField(
                        "To (Destination)",
                        text: $flightSearchVM.destination,
                        onEditingChanged: { editingChanged in
                            flightSearchVM.isDestinationEditing = editingChanged
                        }
                    )
                        .tint(Color("primary"))
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 16))
                        .padding(.trailing, 10)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                }
                .padding(20)
                .background(Capsule().fill(Color("surface")))
                .shadow(radius: 3)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(
                            Color("primary"),
                            lineWidth: flightSearchVM.isDestinationEditing ? 2 : 0)
                )
                .padding(.horizontal, 20)
                .padding(.top, 16)

                Text("When you buy a Carbon Offset, our nonprofit-certified partners reduce or remove the same amount of Carbon from the atmosphere as your flight.")
                    .foregroundColor(Color("tertiary"))
                    .font(.system(size: 13))
                    .padding(.top, 24)
                    .padding(.horizontal, 20)

                Spacer()

                ZStack(alignment: .center) {
                    Button(action: {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        path.append(.flightOffset)
                    }, label: {
                        if flightSearchVM.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color("primary")))
                        } else {
                            Text("Save selections")
                                .tint(Color("primary"))
                                .font(.system(size: 16))
                        }
                    })
                    .frame(width: 160, height: 40, alignment: .center)
                    .background(Color("surface"))
                    .cornerRadius(20)
                    .shadow(color: Color("primary"), radius: 3)
                    .disabled(flightSearchVM.nextDisabled)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .flightOffset:
                    FlightOffsetView(path: $path)
                }
            }
        }
    }
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView(showingDemoView: .constant(true))
    }
}
