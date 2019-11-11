//
//  AppDelegate.swift
//  TweetMD


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: FeedVC(viewModel: FeedVM(webProvider: WebProvider())))
        window?.makeKeyAndVisible()
        
        return true
    }
}

