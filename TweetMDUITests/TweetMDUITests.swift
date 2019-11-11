//
//  TweetMDUITests.swift
//  TweetMDUITests


import Foundation
import XCTest

class TweetMDUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testHighlightsAFavoritedTweet() {
        // Checking for a tweet becoming favorited by making sure it is highlighted
        // and the favorite button state has changed
        TweetMDUIObjects().selectFeedCell()
        TweetMDUIObjects().markAsFavorite()
        TweetMDUIObjects().verifyFavoriteButtonTapped()
        TweetMDUIObjects().returnToFeedView()
        TweetMDUIObjects().verifyFavoritedTweet()
    }

    func testUnhighlightsAnUnfavoritedTweet() {
        // Checking for a favorite tweet becoming unfavorited by making sure
        // it is no longer highlighted and the unfavorite button state has changed
        TweetMDUIObjects().selectFeedCell()
        TweetMDUIObjects().markAsFavorite()
        TweetMDUIObjects().verifyFavoriteButtonTapped()
        TweetMDUIObjects().returnToFeedView()
        TweetMDUIObjects().selectFavoriteFeedCell()
        TweetMDUIObjects().markAsUnfavorite()
        TweetMDUIObjects().verifyUnfavoriteButtonTapped()
        TweetMDUIObjects().returnToFeedView()
        TweetMDUIObjects().verifyUnfavoritedTweet()
    }

    func testDoesNotPersistFavoritedTweetsBetweenSessions() {
        // Meaning, when the app closes and reopens, no tweets are favorited
        // or highlighted.
        TweetMDUIObjects().selectFeedCell()
        TweetMDUIObjects().markAsFavorite()
        TweetMDUIObjects().verifyFavoriteButtonTapped()
        TweetMDUIObjects().returnToFeedView()
        TweetMDUIObjects().verifyFavoritedTweet()
        TweetMDUIObjects().closeAndReopenApp()
        TweetMDUIObjects().verifyUnfavoritedTweet()     
    }
}
