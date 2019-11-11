//
//  TweetDetailVM.swift
//  TweetMD


import Foundation
import UIKit

protocol TweetDetailVMContract {
    var authorName: String { get }
    var authorHandle: String { get }
    var authorProfilePhoto: UIImage? { get }
    var content: String { get }
    var favorited: Bool { get }
    var timeElapsedString: String { get }
    var dateString: String { get }
    var favoriteButtonColor: UIColor { get }
    var favoriteButtonText: String { get }
    
    func toggleFavorites()
}

class TweetDetailVM: TweetDetailVMContract {
    
    // MARK: Properties
    var tweet: Tweet
    
    var authorName: String { return tweet.author.name }
    var authorHandle: String { return tweet.author.handle }
    var content: String { return tweet.text }
    var favorited: Bool { return tweet.favorited }
    
    var authorProfilePhoto: UIImage? {
        guard
            let imageUrl = tweet.author.profileImageUrl,
            let imageData = try? Data(contentsOf: imageUrl)
            else { return nil }
        
        return UIImage(data: imageData)
    }
    
    var timeElapsedString: String {
       return Date.timeElapsedString(since: tweet.createdAt)
    }
    
    var dateString: String {
        return tweet.createdAt.fullDateString()
    }
    
    var favoriteButtonColor: UIColor {
        return favorited ? UIColor.darkGray : UIColor.actionBlue()
    }
    
    var favoriteButtonText: String {
        return favorited ? "Remove from Favorites" : "Add to Favorites"
    }
    
    // MARK: Init
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    // MARK: Methods
    func toggleFavorites() {
        tweet.favorited = !favorited
    }
}
