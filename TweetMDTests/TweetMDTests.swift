//
//  TweetMDTests.swift
//  TweetMDTests


import Foundation
import Quick
import Nimble

@testable import TweetMD

class TweetMDTests: QuickSpec {
    
    override func spec() {
        
        describe("elasped time") {
            describe("its value for 'now'") {
                it("is the lower bound of now") {
                    let since = Date.init(timeIntervalSinceNow: 0)
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("just now"))
                }
                
                it("is the upper bound of now") {
                    let since = Date.init(timeIntervalSinceNow: -59)
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("just now"))
                }
            }
            
            describe("its value for minutes") {
                it("is the lower bound of min") {
                    let since = Date.init(timeIntervalSinceNow: -(60))
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("1m"))
                }
                
                it("is the upper bound of min") {
                    let since = Date.init(timeIntervalSinceNow: -(60 * 59))
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("59m"))
                }
            }
            
            describe("its value for hours") {
                it("is the lower bound of hour") {
                    let since = Date.init(timeIntervalSinceNow: -(60 * 60))
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("1h"))
                }
                
                it("is the upper bound of hour") {
                    let since = Date.init(timeIntervalSinceNow: -(60 * 60 * 23.49))
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("23h"))
                }
            }
            
            describe("its value for days") {
                it("is the lower bound of day") {
                    let since = Date.init(timeIntervalSinceNow: -(60 * 60 * 23.5))
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("1d"))
                }
                
                it("is the upper bound of day") {
                    let since = Date.init(timeIntervalSinceNow: -(60 * 60 * 24 * 7.49))
                    let elapsed = Date.timeElapsedString(since: since)
                    expect(elapsed).to(match("7d"))
                }
            }
            
            describe("its value for dates") {
                it("is a date") {
                    let since = Date.init(timeIntervalSinceNow: -(60 * 60 * 24 * 7.5))
                    let elapsed = Date.timeElapsedString(since: since)
                    let formatter = DateFormatter()
                    formatter.dateFormat = "M/d/yy"
                    let sinceString = formatter.string(from: since)
                    expect(elapsed).to(match(sinceString))
                }
            }
        }
    }
}
