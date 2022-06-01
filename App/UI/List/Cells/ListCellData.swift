//
//  ListTableData.swift
//  App
//
//

import GlobalUI

class ListCellData: TableViewData {
    override var cellType: TableViewCell.Type? { ListCell.self }

    private var forecast: ForecastItem

    var title: String {
        "\(forecast.day) — \(forecast.description)"
    }

    init(forecast: ForecastItem) {
        self.forecast = forecast
        super.init()
    }

    override func hash(into hasher: inout Hasher) {
        hasher.combine(forecast.day)
        hasher.combine(forecast.description)
    }

    override func isEqual(to other: TableViewData) -> Bool {
        guard let other = other as? ListCellData else { return false }
        guard self.forecast.day == other.forecast.day else { return false }
        return self.forecast.description == other.forecast.description
    }
}
