//
//  NetworkManager.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import Moya
import RxSwift
import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    var provider = MoyaProvider<APIClientEndpoint>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    func getNews(q: String?, pageSize: Int?, page: Int?) -> Single<NewsModel> {
        
        return provider.rx                              // we use the Reactive component for our provider
            .request(.everyThing(q: q, pageSize: pageSize, page: page))   // we specify the call
            .filterSuccessfulStatusAndRedirectCodes()   // we tell it to only complete the call if the operation is successful, otherwise it will give us an error
            .map(NewsModel.self)
            .catchError { error in // get error and throw it as custom error
                print(error)
                var appError: AppError = AppError()
                if let moyaError = error as? MoyaError {
                    appError.statusCode = moyaError.response?.statusCode
                    appError.message = moyaError.errorDescription
                }
                throw appError
            }
    }
}
