//
//  PreferencePaneWrapper.swift
//  StandaloneApp
//
//  Created by Cap'n Slipp on 12/19/22.
//

import Cocoa
import PreferencePanes



class PreferencePaneWrapper : NSWindowController, NSWindowDelegate
{
	private override init(window: NSWindow?) {
		super.init(window: window)
	}
	
	convenience init(nibName: NSNib.Name, bundle nibBundle: Bundle? = nil, window: NSWindow)
	{
		self.init(window: nil)
		
		_window = window
		
		self.preferencePane = {
			let nibBundle = nibBundle ?? Bundle(for: PrefPane.self)
			
			let pane = PrefPane(bundle: nibBundle)
			pane.mainNibName = nibName
			return pane
		}()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		self.preferencePane = super.owner as! PrefPane?
	}
	
	private(set) var preferencePane: PrefPane!
	
	private var _window: NSWindow?
	
	var _isWindowLoaded: Bool = false
	override var isWindowLoaded: Bool { _isWindowLoaded }
	
	
	override func loadWindow()
	{
		print("loadWindow()")
		
		if let window = _window {
			self.window = window
			window.delegate = self
			_isWindowLoaded = true
		}
		else {
			super.loadWindow()
			_isWindowLoaded = super.isWindowLoaded
		}
	}
	
	override func windowDidLoad() {
		loadPrefPaneMainView()
	}
	
	private func loadPrefPaneMainView()
	{
		let mainView = self.preferencePane.loadMainView()
		
		self.preferencePane.willSelect()
		
		self.window!.contentView = mainView
		
		self.preferencePane.didSelect()
	}
	
	
	override func showWindow(_ sender: Any?) {
		print("showWindow(_:)")
		
		super.showWindow(sender)
	}
}
