//
//  MyAppNavigation.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import UIKit

enum MyNavigation: Navigation {
    case searchResluts
    case newsDetails
}
struct MyAppNavigation: AppNavigation {

    func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? MyNavigation {
            switch navigation {
         
            case .searchResluts:
                return DashboardViewController()
                
            case .newsDetails:
                return NewsDetailsController()

            }
        }
        return UIViewController()
    }

    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
      from.navigationController?.pushViewController(to, animated: true)
    }
}
