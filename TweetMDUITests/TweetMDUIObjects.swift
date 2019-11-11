//
//  TweetMDUIObjects.swift
//  TweetMDUITests

import XCTest

// Launching instance of the app
let app = XCUIApplication()

// Organizing elements and identifiers defined by unique strings commonly used for XCUITest behaviors
enum TweetMDObjects: String {
    
    case feedCell = "feed_cell"
    case favoriteButton = "Add to Favorites"
    case unfavoriteButton = "Remove from Favorites"
    case navigationButton = "TweetMD"
    case favoriteFeedCell = "favorite_feed_cell"
    
    var element: XCUIElement {
        switch self {
        case .feedCell, .favoriteFeedCell:
            return app.tables.containing(.cell, identifier:self.rawValue).element(boundBy: 0)
        case .favoriteButton, .unfavoriteButton:
            return app.buttons[self.rawValue]
        case .navigationButton:
            return app.navigationBars[self.rawValue].buttons[self.rawValue]
        }
    }
}

// Class consisting of methods that sets actions and/or verifications from the defined elements
class TweetMDUIObjects {
    
    func selectFeedCell() {
        TweetMDObjects.feedCell.element.tap()
    }
    
    func selectFavoriteFeedCell() {
        TweetMDObjects.favoriteFeedCell.element.tap()
    }
    
    func markAsFavorite() {
        TweetMDObjects.favoriteButton.element.tap()
    }
    
    func markAsUnfavorite() {
        TweetMDObjects.unfavoriteButton.element.tap()
    }
    
    func verifyFavoriteButtonTapped() {
        XCTAssertTrue(TweetMDObjects.unfavoriteButton.element.isHittable, "Favorite button was not tapped.")
    }
    
    func verifyUnfavoriteButtonTapped() {
        XCTAssertTrue(TweetMDObjects.favoriteButton.element.isHittable, "Unfavorite button was not tapped.")
    }
    
    func returnToFeedView() {
        TweetMDObjects.navigationButton.element.tap()
    }
    
    func verifyFavoritedTweet() {
        XCTAssertTrue(TweetMDObjects.favoriteFeedCell.element.isHittable, "No tweet found that is marked as favorite.")
    }
    
    func verifyUnfavoritedTweet() {
        XCTAssertTrue(TweetMDObjects.feedCell.element.isHittable, "Found a tweet that is still marked favorite.")
    }
    
    func closeAndReopenApp() {
        app.terminate() // Close the app
        app.launch() // Reopen the app
    }

}
