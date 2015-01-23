//
//  AppDelegate.swift
//  Sidebar Demo
//
//  Created by John Popham on 23/01/2015.
//  Copyright (c) 2015 xxx. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var leftTitle: NSView!
    
    @IBOutlet weak var sidebar1: sideVC1!
    @IBOutlet weak var sidebar2: sideVC2!
    @IBOutlet weak var sidebar3: sideVC3!
    @IBOutlet weak var sidebar4: sideVC4!
    
    @IBOutlet weak var mySplitViewController: NSSplitViewController!
    @IBOutlet weak var myStackViewController: NSViewController!
    @IBOutlet weak var myStackView: NSStackView!
    @IBOutlet weak var rightViewController: RightViewController!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // set whether panels are initially open
        self.sidebar1.isClosed = true
        self.sidebar2.isClosed = true
        self.sidebar3.isClosed = false
        self.sidebar4.isClosed = false
        
        // put the panels into the stack
        myStackView = NSStackView(views: [
            self.leftTitle,
            self.sidebar1.view,
            self.sidebar2.view,
            self.sidebar3.view,
            self.sidebar4.view
            ])
        
        // align the left edges of the panels
        myStackView.alignment = NSLayoutAttribute.Left
        
        // no spacing between the panels
        myStackView.spacing = 0
        
        // point the view controller at the stack
        myStackViewController.view = myStackView
        
        // add the stackview and the right view to the splitview
        mySplitViewController.addSplitViewItem(NSSplitViewItem(viewController: myStackViewController))
        mySplitViewController.addSplitViewItem(NSSplitViewItem(viewController: rightViewController))
        mySplitViewController.splitView.adjustSubviews()
        
        // point the application's window at the split view
        self.window.contentView = mySplitViewController.splitView
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

