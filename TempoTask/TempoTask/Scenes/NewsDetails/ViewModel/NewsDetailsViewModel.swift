//
//  NewsDetailsViewModel.swift
//  TempoTask
//
//  Created by Zeinab Reda on 20/08/2021.
//

import Foundation
import RxSwift



protocol NewsDetailsViewModelType {
    var topicObservable: Observable<Article> { get }
    func getTopic()
}

class NewsDetailsViewModel: BaseViewModel, NewsDetailsViewModelType {
    var topicObservable: Observable<Article>
    private var topic: Article
    private let topicSubject = PublishSubject<Article>()

    init(topic: Article) {
        self.topic = topic
        topicObservable = topicSubject.asObservable()
        super.init()
    }

    func getTopic() {
        topicSubject.onNext(topic)
    }
}
