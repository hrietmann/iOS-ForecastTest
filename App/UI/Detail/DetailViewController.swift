//
//  DetailViewController.swift
//  App
//
//

import UIKit
import Combine
import GlobalUI

class DetailViewController: UIViewController {
    
    private let item: ForecastItem

    public init(item: ForecastItem? = nil) {
        self.item = item ?? .dummy
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addFullScreenView(DetailView(item: item))
    }
}
