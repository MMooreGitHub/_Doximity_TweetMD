# XCUITest Example

This was a coding test/assignment that I passed recently. Please read reflections.md for the changes I made to the following scripts.

# Automation Assignment for iOS

We would like to thank you for taking the time to complete this assignment. We believe this is an effective way to allow you to show us your skills, on your own time, without the pressure of someone looking over your shoulder. Your code will be used to help us decide if we'd like to proceed with the interview process. Please understand that completing this assignment doesn't guarantee a job or follow up interviews. We will keep you posted either way.

Note that while there is no time limit, it should take you 2-4 hours to complete this assignment.

# TweetMD

TweetMD is a little app we created exclusively for the take home assignment. It allows clinicians to stay up to date on the latest medical tweets! It uses the [Twitter API](https://dev.twitter.com/rest/public) to fetch the top 30 recent tweets about 'medicine' and displays them for your viewing pleasure (regardless of actual relevance to medicine...)

We have already completed the desired functionality for TweetMD. Your job is to fix some broken code that failing tests should reveal, write a few more additional tests, and wire the project up to CI.

# Tasks

### Task 1
After opening the project in Xcode, run the existing tests using CMD + U. You'll notice several of them fail. Please determine the root cause of the test failure (it could be in the tests themselves or even in the code under test) and correct it so that all existing tests pass.

The unit tests are using the [Quick](https://github.com/Quick/Quick) testrunner and [Nimble](https://github.com/Quick/Nimble) assertions.

### Task 2
We'd like to test a few end-to-end scenarios and have included a UI testing target (`TweetMDUITests`) to facilitate that kind of testing.

Please complete all specified scenarios in `TweedMDUITests.swift`. Attempt to make your test automation code as maintainable as possible. You are free and welcome to make any additions or alterations to the source code that would make your UI automation work easier, so long as all tests pass at the end.

Some resources:
* [XCTest UI Testing](https://developer.apple.com/documentation/xctest/user_interface_tests).
* http://masilotti.com/ui-testing-cheat-sheet/
* https://medium.com/the-ministry-of-testing/adding-accessibility-identifiers-to-an-ios-app-c8e09d9c20f3
* https://developer.apple.com/documentation/uikit/uiaccessibilityidentification/1623132-accessibilityidentifier
* https://alexilyenko.github.io/xcuitest-page-object/

### Task 3
Now that we have multiple test suites, let's start wiring up to CI so this project can be continuously tested.

The first step towards that goal is a [Fastlane](https://fastlane.tools/) task that performs a build of the project and runs both test targets.

Please implement a task that accomplishes this goal in `fastlane/Fastfile`.

You should be able to test this task on your local machine via `bundle exec fastlane run_my_tests`.

### Task 4
Now that we have our fastlane task, please produce a [CircleCI 2.0](https://circleci.com/docs/2.0/testing-ios/) config file that would successfully execute the tests in CI.

Unfortunately, MacOS build machines are not available on the CircleCI free plan, so you won't be able to _really_ see if your config works. What you _can_ do, however, is validate your `.circleci/config.yml` using the CLI.

`brew install circleci`

You can then validate your CircleCI config like so:

`circleci config validate -c .circleci/config.yml`

Please use the linked CircleCI documentation and anything you can find to complete this final portion of the assignment. CircleCI CLI validation of your config file should be successful prior to submission.

### Reflections
If there are additional test scenarios you would implement, or any other improvement to the test automation infrastructure or CI setup that you would make if given time, you are welcome to add a description of the improvements you would make in Reflections.md. You are also encouraged to add as many comments as you deem necessary to your pull request.
