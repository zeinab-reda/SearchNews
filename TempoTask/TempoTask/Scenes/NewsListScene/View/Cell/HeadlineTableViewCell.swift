//
//  HeadlineTableViewCell.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 20/06/2021.
//

import UIKit
import AlamofireImage

class HeadlineTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsSnippet: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsSource: UILabel!
    
    
    var item:Article? {
        didSet{
            newsTitle.text = item?.title
            newsSource.text = item?.source?.name
            if let link = item?.urlToImage, let url = URL(string: link) {
                newsImg.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"))
            }
        }
        
    }
    
 
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsImg.roundCorners(corners: [.topLeft, .topRight], radius: 15.0)

    }
    
    
}
