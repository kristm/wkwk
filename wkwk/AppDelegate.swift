//
//  AppDelegate.swift
//  wkwk
//
//  Created by Krist Menina on 2/17/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var statusBar: StatusBarController?
    @ObservedObject var myConfig: Config = Config()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(myConfig)
        

        // Create the window and set the content view.
        // NOTE: Reinstantiating this window crashes the ap
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
//        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        
        statusBar = StatusBarController.init()
        fileNotifications()
    }
    
    @objc func onWakeNote(note: NSNotification) {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from :date)
        let today = calendar.component(.day, from :date)
        let month = calendar.component(.month, from :date)
        NSLog("onwake %v", today)
        if myConfig.timeIn != nil {
            let loggedDate = myConfig.timeIn ?? Date()
            let loggedInDay = calendar.component(.day, from :loggedDate)
            let loggedInMonth = calendar.component(.month, from :loggedDate)
            print("last logged day \(loggedInDay) - \(today)")
            if today > loggedInDay || month > loggedInMonth {
                myConfig.resetTime()
            }
        }
        print("wakey wakey \(hour)")
        if (hour <= 11 || hour >= 19) {
            showSponge()
        }
    }
    
    func showSponge() {
        print(">\(myConfig.getTime()) \(myConfig.lapsedTime)")
        
        myConfig.getTime()
        
        window.center()
        window.makeKeyAndOrderFront(nil)
        window.level = .floating
        window.isReleasedWhenClosed = false
    }
    
    func fileNotifications() {
        NSWorkspace.shared.notificationCenter.addObserver(
            self, selector: #selector(onWakeNote(note:)),
            name: NSWorkspace.didWakeNotification, object: nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}
