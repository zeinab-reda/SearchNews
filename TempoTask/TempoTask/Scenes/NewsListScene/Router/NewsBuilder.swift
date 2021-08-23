//
//  NewsRouter.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import UIKit
struct NewsBuilder {
    static func viewController() -> UIViewController {
        let viewModel = NewsViewModel()
        let router = NewsRouter()
        let viewController = DashboardViewController(withViewModel: viewModel, router: router)
        router.viewController = viewController
        return viewController
    }
}
