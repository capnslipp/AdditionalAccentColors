//
//  AppDelegate.swift
//  StandaloneApp
//
//  Created by Cap'n Slipp on 12/18/22.
//

import Cocoa



@main
class AppDelegate: NSObject, NSApplicationDelegate
{

	@IBOutlet var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification)
	{
		let prefPaneWrapper = PreferencePaneWrapper(nibName: "AdditionalAccentColors", window: self.window)
		_ = prefPaneWrapper.window
		prefPaneWrapper.showWindow(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
		return true
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
}

