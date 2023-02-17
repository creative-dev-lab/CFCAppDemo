//
//  FlightSearchViewModel.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation

class FlightSearchViewModel: ObservableObject {
    @Published var fromLocation: String = ""
    @Published var destination: String = ""
    @Published var isFromLocationEditing: Bool = false
    @Published var isDestinationEditing: Bool = false
    @Published var fromLocationSelectedResult: String = ""
    @Published var destinationSelectedResult: String = ""
    @Published var isLoading: Bool = false

    var nextDisabled: Bool {
        fromLocation.isEmpty || destination.isEmpty
    }

    var isFromSearching: Bool {
        fromLocation.count > 0 && isFromLocationEditing
    }

    var isToSearching: Bool {
        destination.count > 0 && isDestinationEditing
    }

    func saveLocation(completion: @escaping (Bool) -> Void) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            completion(true)
        }
    }
}
