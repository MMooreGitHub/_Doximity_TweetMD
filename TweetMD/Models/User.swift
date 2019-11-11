//
//  User.swift
//  TweetMD


import Foundation

struct UserMention: Decodable {
    let id: Int
    let name: String
    let range: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case range = "indices"
    }
}

struct User: Decodable {
    let id: Int
    let name: String
    let handle: String
    let profileImageUrlString: String
    
    var profileImageUrl: URL? {
        return URL(string: profileImageUrlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case handle = "screen_name"
        case profileImageUrlString = "profile_image_url_https"
    }
}
