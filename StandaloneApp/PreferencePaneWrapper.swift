//
//  PreferencePaneWrapper.swift
//  StandaloneApp
//
//  Created by Cap'n Slipp on 12/19/22.
//

import Cocoa
import PreferencePanes



class PreferencePaneWrapper : NSWindowController
{
	private override init(window: NSWindow?) {
		super.init(window: window)
	}
	
	//init(preferencePane: NSPreferencePane, nib: NSNib)
	//{
	//	self.preferencePane = preferencePane
	//	self.nib = nib
	//}
	
	convenience init(preferencePane: NSPreferencePane, nibName: NSNib.Name, bundle nibBundle: Bundle? = nil)
	{
		self.init(windowNibName: nibName, owner: preferencePane)
		// Obj-C-style subclass init after superclass init, since NSWindowController seems to replace `self` (probably a class cluster).
		self.preferencePane = preferencePane
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		self.preferencePane = super.owner as! NSPreferencePane?
	}
	
	private(set) var preferencePane: NSPreferencePane!
	//private(set) var nib: NSNib
	
	
	override func loadWindow()
	{
		//print("loadWindow()")
		super.loadWindow()
		//let preferencePaneClass = type(of: preferencePane)
		//let nibBundle = nibBundle ?? Bundle(for: preferencePaneClass)
		//let nib = NSNib(nibNamed: nibName, bundle: nibBundle)!
		//self.init(preferencePane: preferencePane, nib: nib)
	}
	
	override func windowWillLoad()
	{
		//print("windowWillLoad()")
		super.windowDidLoad()
	}
	
	override func windowDidLoad()
	{
		//print("windowDidLoad()")
		super.windowDidLoad()
		
		// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
	}

}
