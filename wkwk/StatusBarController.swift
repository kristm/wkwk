//
//  StatusBarController.swift
//  wkwk
//
//  Created by Krist Menina on 2/17/20.
//  Copyright © 2020 Hello Wala Studios. All rights reserved.
//

import AppKit

class StatusBarController
{
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var window: NSWindow
    private var statusBarButton: NSStatusBarButton
    
    init(_ window: NSWindow)
    {
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        statusBarButton = statusItem.button!
        self.window = window
        
        statusBarButton.image = #imageLiteral(resourceName: "twinpopsies")
        statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
        statusBarButton.image?.isTemplate = true
        
        statusBarButton.action = #selector(togglePopover(sender:))
        statusBarButton.target = self
    }
        
    @objc func togglePopover(sender: AnyObject)
    {
        print("toggle over")
        window.center()
        window.makeKeyAndOrderFront(nil)
        window.level = .floating
    }
}
