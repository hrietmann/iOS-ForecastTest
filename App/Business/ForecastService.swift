//
//  ForecastService.swift
//  App
//
//

import Combine

protocol ForecastService {
    var items: CurrentValueSubject<ForecastItems, Never> { get }
    func remove(item: ForecastItem)
}
