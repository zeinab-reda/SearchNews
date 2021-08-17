//
//  Constant.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import Foundation


struct K {
    enum ProductionServer :String{
        case baseApiURL = "https://newsapi.org/"
        case apiKey = "a9860808253d46e1b686dbc7ed9aa9bd"
    }
    enum StoryBoard:String
    {
         case boardingSB = "Boarding"
         case dashboardSB = "Dashboard"
    }
    
    enum Keys:String {
        case country = "country"
        case category = "category"
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
    
}
