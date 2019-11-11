## iOS Automation Assignment Reflections

The order of the conditional statements (with days set before hours) in the timeElapsedString method was off in comparison to how the constants were defined in its specific order, so swapping that into the proper order fixed the Unit Tests.

XCTAssertTrue (also XCTAssert) expression being false will generate a failure by default. Also, the current expressions are not checking for any expected elements to verify assertion, nor is there any behavior put in place to test for it.

With verifying favorites, on view the only two obvious verifications are the text change of the favorite button and the color change of the tweet cell. However, you can’t really verify the background color change as XCUITest can’t communicate with several UIKit properties, so I went with adding another condition to check by giving both states of favorite and unfavorite each an accessibilityIdentifier via a ternary conditional. 

For Fastlane setup, I had considered creating a new scheme specifically for the test targets, but it seemed unnecessary since the default TweetMD scheme had the two test targets already active and didn’t impede running the build to run the Unit and UI tests. I figured setting the configuration with three devices given different display sizes and use cases (from oldest non-deprecated device to a more current device) to provide some sufficient coverage. I had to disable concurrent testing however due to a [known issue](https://github.com/xcpretty/xcpretty/issues/295) in Fastlane involving parallel testing not providing proper test results from xcpretty. 

Given there are some CocoaPods dependencies being used in this project, I included the configuration for installing into my CircleCI config file.

After completion, some improvements I would make are:

* For UITests, checking for a random cell row (tweet) or multiple rows (tweets) with swipe down behavior when required. 
* For the page objects portion of the UITests that I added, I would consider making use of defining elements as standard separate types (eg. buttonElements, navigationBars, cells, etc.) and implement some sort of BDD like Cucumber into it that can allow these tests to be organized as step definitions.
* Make sure test reports are embedded on a webpage via a parser for detailed view
* Include an additional environment in Fastlane to check a previous iOS version, if there is still a significant userbase
* Add more unit tests for testing UI background color between favorite and unfavorite tweets, favorite button color, and tweet author properties
