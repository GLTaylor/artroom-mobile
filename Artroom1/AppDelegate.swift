//
//  AppDelegate.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/17/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let artwork = jsonResult["artwork"] as? [Any] {
                    print(artwork.count)
                }
            } catch {
                //handle error somehow
            }
        }
      
        
        return true
    }


}
