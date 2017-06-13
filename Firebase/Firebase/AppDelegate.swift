//
//  AppDelegate.swift
//  Firebase
//
//  Created by Brendon Warwick on 13/06/2017.
//  Copyright © 2017 Brendon Warwick. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        loadCookies()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        saveCookies()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func saveCookies() {
        let cookiesData: Data! = NSKeyedArchiver.archivedData(withRootObject: HTTPCookieStorage.shared.cookies as [HTTPCookie]!)
        let defaults = UserDefaults.standard
        defaults.set(cookiesData, forKey: "cookies")
        defaults.synchronize()
    }

    func loadCookies() {
        if let cookiesSave = UserDefaults.standard.object(forKey: "cookies") {
            if let cookies = NSKeyedUnarchiver.unarchiveObject(with: cookiesSave as! Data) {
                let cookiesArray = cookies as! [HTTPCookie]
                let cookieStorage = HTTPCookieStorage.shared
                for cookie: HTTPCookie in cookiesArray {
                    cookieStorage.setCookie(cookie)
                }
            }
        }
    }

}

