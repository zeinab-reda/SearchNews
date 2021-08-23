//
//  NewsRouter.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import UIKit

protocol NewsRouterType {
    func navigateToDetails(_ topic:NewsModel)
}

final class NewsRouter : NewsRouterType {
    
    weak var viewController:DashboardViewController?
    func navigateToDetails(_ topic:NewsModel){
        viewController?.navigationController?.pushViewController(NewsDetailsBuilder.viewController(topic), animated: true)

    }
}
