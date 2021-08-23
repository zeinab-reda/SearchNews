//
//  SearchViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit
import RxSwift
class NewsDetailsController: UIViewController {

    private var viewModel: NewsDetailsViewModelType

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  

    init(withViewModel viewModel: NewsDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: "NewsDetailsViewController", bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func adjustUI() {
        viewModel.topicObservable.subscribe { [weak self] topic in
//            self?.titleLbl.text = topic.title
//            if let link = topic.media?.first?.mediaMetadata?.first?.url, let url = URL(string: link) {
//                self?.topicImg.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"))
//            }
//            self?.topicDetailsLbl.text = topic.abstract

        } onError: { _ in
        }.disposed(by: disposeBag)
    }
}
