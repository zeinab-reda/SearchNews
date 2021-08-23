//
//  NewsDetailsViewModel.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import RxSwift

protocol NewsDetailsViewModelType {
    
    var topicObservable:Observable<NewsModel>{get}
    func getTopic()
}

class NewsDetailsViewModel : BaseViewModel , NewsDetailsViewModelType {
    
    var topicObservable: Observable<NewsModel>
    private var topic:NewsModel
    private let topicSubject = PublishSubject<NewsModel>()
 
    override init() {
        
    }
//    convenience init(topic:NewsModel) {
//        self.topic = topic
//        topicObservable = topicSubject.asObserver()
//        self.init(topic: topic)
//    }
    func getTopic() {
        topicSubject.onNext(topic)
    }
}
