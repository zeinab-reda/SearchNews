//
//  SearchViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit
import RxSwift
import AlamofireImage
class NewsDetailsViewController: BaseViewController {

//    private var viewModel: NewsDetailsViewModelType

//    private let disposeBag = DisposeBag()
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var newsContent: UITextView!
    var article:Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustUI()

    }

    @objc public static func create() -> NewsDetailsViewController {
        return UIStoryboard(name: K.StoryBoard.dashboardSB.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! NewsDetailsViewController
     }
    
    func adjustUI() {
        self.newsTitle.text = article?.title
        if let link = article?.urlToImage, let url = URL(string: link) {
            self.newsImg.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"))
            }
        self.newsContent.text = article?.content
        self.author.text = "By : \(article?.author)"

    }
}
