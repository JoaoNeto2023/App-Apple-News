//
//  NewsTableViewCell.swift
//  AppAppleNews
//
//  Created by João Neto  on 03/10/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sourceNamelabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descritionLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var linkImageView: UIImageView!
    
    public var news: NewsModel? {
        didSet {
            self.sourceNamelabel.text = news?.source.name
            self.authorLabel.text = news?.author
            self.titleLabel.text = news?.title
            self.descritionLabel.text = news?.description
            self.imageImageView.loadImage(from: news?.urlToImage)
            self.publishedLabel.text = news?.publishedAt.toString()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openLink))
        self.linkImageView.isUserInteractionEnabled = true
        self.linkImageView.addGestureRecognizer(tap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func openLink() {
        guard let news = news, let url = URL(string: news.url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
}




