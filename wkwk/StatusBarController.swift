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
    private var statusBarButton: NSStatusBarButton
    
    init()
    {
        statusBar = NSStatusBar.init()
        statusItem = statusBar.statusItem(withLength: 28.0)
        statusBarButton = statusItem.button!
        
        statusBarButton.image = #imageLiteral(resourceName: "twinpopsies")
        statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
        statusBarButton.image?.isTemplate = true
        
        statusBarButton.action = #selector(togglePopover(sender:))
        statusBarButton.target = self
    }
        
    @objc func togglePopover(sender: AnyObject)
    {
//        This invokes app delegate methods
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        appDelegate.showSponge()
        
        print("toggle over")
    }
}
