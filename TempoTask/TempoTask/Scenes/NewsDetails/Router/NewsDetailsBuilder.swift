//
//  NewsDetailsBuilder.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import UIKit
struct NewsDetailsBuilder {
    static func viewController(_ topic: NewsModel) -> UIViewController {
        let viewModel = NewsDetailsViewModel(topic: topic)
        let viewController = NewsDetailsController(withViewModel: viewModel)
        return viewController
    }
}
