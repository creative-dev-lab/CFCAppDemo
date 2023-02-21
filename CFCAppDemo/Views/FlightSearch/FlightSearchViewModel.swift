//
//  FlightSearchViewModel.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation
import Combine

final class FlightSearchViewModel: ObservableObject {
    @Published var fromLocation: String = ""
    @Published var destination: String = ""
    @Published var isFromLocationEditing: Bool = false
    @Published var isDestinationEditing: Bool = false
    @Published var fromLocationSelectedResult: SearchResult? = nil
    @Published var destinationSelectedResult: SearchResult? = nil
    @Published var fromLocationResults: [SearchResult] = []
    @Published var destinationResults: [SearchResult] = []
    @Published var offsetResult: OffsetResult? = nil
    @Published var fromLocationToDestination: String = ""
    @Published var apiError: APIError? = .none
    @Published var isLoading: Bool = false
    private var cancellable: AnyCancellable?

    var nextDisabled: Bool {
        fromLocationSelectedResult == nil || destinationSelectedResult == nil
    }

    var isFromSearching: Bool {
        fromLocationResults.count > 0
    }

    var isToSearching: Bool {
        destinationResults.count > 0
    }

    func search(text: String, isFromLocation: Bool) {
        fromLocationResults = []
        destinationResults = []

        cancellable = CFCClient().search(text: text)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    #if DEBUG
                    print("Failed to fetch data: ", error)
                    #endif
                case .finished:
                    #if DEBUG
                    print(result)
                    #endif
                }
            }, receiveValue: { [weak self] in
                if isFromLocation {
                    self?.fromLocationResults.append(contentsOf: $0.results)
                } else {
                    self?.destinationResults.append(contentsOf: $0.results)
                }
            })
    }

    func saveLocation(originAirportID: String, destinationAirportID: String, completion: @escaping (Bool) -> Void) {
        isLoading = true

        cancellable = CFCClient().getOffset(originID: originAirportID, destID: destinationAirportID)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .failure(let error):
                    /// in case we got the failed response, returned a mock response.
                    self?.returnOffsetResponse(result: nil)
                    completion(true)

                    /// or return error to show up error message.
//                    self?.apiError = .fetchError(error)
                    #if DEBUG
                    print("Failed to fetch data: ", error)
                    #endif
                case .finished:
                    #if DEBUG
                    print(result)
                    #endif
                }
            }, receiveValue: { [weak self] in
                self?.returnOffsetResponse(result: $0)
                completion(true)
            })
    }

    private func returnOffsetResponse(result: OffsetResult?) {
        fromLocationToDestination = "\(fromLocationSelectedResult?.municipality ?? "") (\(fromLocationSelectedResult?.iataCode ?? "")) To \(destinationSelectedResult?.municipality ?? "") (\(destinationSelectedResult?.iataCode ?? ""))"
        offsetResult = result ?? OffsetResult.example

        fromLocation = ""
        destination = ""
        fromLocationResults = []
        destinationResults = []
        fromLocationSelectedResult = nil
        destinationSelectedResult = nil

        isLoading = false
    }
}

enum APIError: Identifiable {
    var id: String { UUID().uuidString }
    case fetchError(_: Error)
    var description: String {
        switch self {
        case .fetchError(let error):
            return error.localizedDescription
        }
    }
}
