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
    var myStore: Store = Store.sharedInstance

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(myStore)

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
        let hour = calendar.component(.hour, from: date)
        print("wakey wakey \(hour)")
        if (hour <= 11 || hour >= 19) {
            myStore.status = (hour <= 11) ? "1" : "2"
        
            showSponge()
        }
    }
    
    func showSponge() {
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

class Store: ObservableObject {
    static let sharedInstance = Store()
    @Published var status: String = "1"
}
