//
//  ForecastServiceProvider.swift
//  App
//
//  Created by Hans Rietmann on 01/06/2022.
//

import Combine
import Global



final class ForecastServiceProvider: ForecastService {
    
    
    @Inject var networkService: ForecastNetworkService
    var items: CurrentValueSubject<ForecastItems, Never>
    private var cancelables = Set<AnyCancellable>()
    
    
    init(demo: Bool = false) {
        guard !demo else {
            items = .init(.dummies)
            return
        }
        items = .init([])
        networkService.getForecast()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] in self?.completionHandler($0) },
                receiveValue: { [weak self] in self?.updateItems(to: $0) }
            )
            .store(in: &cancelables)
    }
    
    
    private func completionHandler(_ completionStatus: Subscribers.Completion<Error>) {
        switch completionStatus {
        case .failure(let error):
            print(error)
            fatalError("Unexpected error was thrown by the network service during forecast items download.")
        default:
            print("Forcast items download with the network service went well.")
        }
    }
    
    
    private func updateItems(to networkServiceItems: ForecastItemDTOs) {
        let items: ForecastItems = networkServiceItems
            .map { .init(day: $0.day, description: $0.description, type: $0.type) }
        self.items.send(items)
    }
    
    
    func remove(item: ForecastItem) {
        guard let index = items.value.firstIndex(of: item) else { return }
        var items = self.items.value
        items.remove(at: index)
        self.items.send(items)
    }
    
    
}
