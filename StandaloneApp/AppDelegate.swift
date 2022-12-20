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
		let prefPane = PrefPane(bundle: Bundle(for: PrefPane.self))
		let prefPaneWrapper = PreferencePaneWrapper(preferencePane: prefPane, nibName: "AdditionalAccentColors")
		_ = prefPaneWrapper.window
		//self.window = prefPaneWrapper.window
		self.window = prefPane.window
		//prefPaneWrapper.loadWindow()
		prefPane.window.makeKeyAndOrderFront(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
		return true
	}


}

