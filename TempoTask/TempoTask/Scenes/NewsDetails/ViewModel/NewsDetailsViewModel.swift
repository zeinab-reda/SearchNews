//
//  NewsDetailsViewModel.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import RxSwift



protocol NewsDetailsViewModelType {
    var topicObservable: Observable<NewsModel> { get }
    func getTopic()
}

class NewsDetailsViewModel: BaseViewModel, NewsDetailsViewModelType {
    var topicObservable: Observable<NewsModel>
    private var topic: NewsModel
    private let topicSubject = PublishSubject<NewsModel>()

    init(topic: NewsModel) {
        self.topic = topic
        topicObservable = topicSubject.asObservable()
        super.init()
    }

    func getTopic() {
        topicSubject.onNext(topic)
    }
}
