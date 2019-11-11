//
//  FeedCell.swift
//  TweetMD


import Foundation
import UIKit
import AlamofireImage

class FeedCell: UITableViewCell {
    static var reuseIdentifier: String {
        return "FeedCell"
    }
    
    static var userMentionStyle: [NSAttributedString.Key: Any] = [
        .foregroundColor : UIColor.actionBlue()
    ]
    
    @IBOutlet private var thumbnailImage: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var handleLabel: UILabel!
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var timeElapsedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImage.layer.cornerRadius = 5.0
        thumbnailImage.clipsToBounds = true
    }
    
    func configure(with tweet: Tweet) {
        nameLabel.text = tweet.author.name
        handleLabel.text = tweet.author.handle
        contentLabel.attributedText = textWithHighlightedMentions(tweet: tweet)
        timeElapsedLabel.text = Date.timeElapsedString(since: tweet.createdAt)
        contentView.backgroundColor = tweet.favorited ? UIColor.yellow : UIColor.white
        
        // The cell will be given its own unique accessiblityIdentifier whether it is
        // favorited or unfavorited which is used to verify the current state in UI Tests
        accessibilityIdentifier = tweet.favorited ? "favorite_feed_cell" : "feed_cell"

        if
            let profileImageUrl = tweet.author.profileImageUrl,
            let placeholderImage = Image(named: "baseline_person_black_24pt") {
            thumbnailImage.af_setImage(withURL: profileImageUrl, placeholderImage: placeholderImage)
        } else {
            thumbnailImage.image = nil
        }
    }
    
    func textWithHighlightedMentions(tweet: Tweet) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: tweet.text)
        for mention in tweet.userMentions {
            let range = NSRange(mention.range[0]..<mention.range[1])            
            attributedText.addAttributes(FeedCell.userMentionStyle, range: range)
        }
        return attributedText
    }
}
