//
//  DetailViewCoordinator.swift
//  App
//
//

import Foundation
import UIKit

class DetailViewCoordinator {
    
    weak var navigationController: UINavigationController?
    private weak var viewController: DetailViewController?
    
    func present(item: ForecastItem, in window: UIWindow) {
        navigationController = window.rootViewController as? UINavigationController
        
        let detailViewController = DetailViewController(item: item)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
