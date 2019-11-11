//
//  Tweet.swift
//  TweetMD


import Foundation

struct TweetsContainer: Decodable {
    let tweets: [Tweet]
    
    enum CodingKeys: String, CodingKey {
        case tweets = "statuses"
    }
}

struct Entities: Decodable {
    let userMentions: [UserMention]
    
    enum CodingKeys: String, CodingKey {
        case userMentions = "user_mentions"
    }
}

class Tweet: Decodable {
    let id: Int
    let text: String
    let userMentions: [UserMention]
    let author: User
    let createdAtString: String
    var favorited: Bool = false
    
    var createdAt: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MMM d HH:mm:ss Z yyyy"
        return dateFormatter.date(from: createdAtString) ?? Date()
    }

    enum CodingKeys: String, CodingKey {
        case id
        case text
        case author = "user"
        case createdAtString = "created_at"
        case entities
        case userMentions = "user_mentions"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        text = try container.decode(String.self, forKey: .text)
        author = try container.decode(User.self, forKey: .author)
        createdAtString = try container.decode(String.self, forKey: .createdAtString)
        userMentions = try container.decode(Entities.self, forKey: .entities).userMentions
    }
}
