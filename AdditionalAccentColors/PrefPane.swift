//
//  AdditionalAccentColors.swift
//  AdditionalAccentColors
//
//  Created by Cap'n Slipp on 12/18/22.
//

import PreferencePanes



fileprivate func log(_ message: String)
{
	print("\(message)")
	
	DistributedNotificationCenter.default().postNotificationName(
		.init("AdditionalAccentColorsNotification"),
		object: message,
		deliverImmediately: true
	)
}



class PrefPane : NSPreferencePane
{
	override init(bundle: Bundle) {
		log("\(Self.self)#\(#function)")
		
		super.init(bundle: bundle)
	}
	
	
	var _mainNibName: NSNib.Name?
	override var mainNibName: String {
		get {
			if let customizedValue = _mainNibName {
				log("\(Self.self)#\(#function): \(customizedValue)")
				return customizedValue
			}
			
			let value = super.mainNibName
			log("\(Self.self)#\(#function): \(value)")
			return value
		}
		set {
			_mainNibName = newValue
		}
	}
	
	
	override func loadMainView() -> NSView {
		log("\(Self.self)#\(#function)")
		
		let view = super.loadMainView()
		return view
	}
	override func assignMainView() {
		log("\(Self.self)#\(#function)")
		
		super.assignMainView()
	}
	
	
	override func mainViewDidLoad()
	{
		log("\(Self.self)#\(#function)")
		
		//let alert = NSAlert()
		//alert.messageText = "This is the message text"
		//alert.informativeText = "This is the informative text"
		//alert.addButton(withTitle: "OK")
		//alert.addButton(withTitle: "Cancel")
//
		//let response = alert.runModal()
		//if response == .alertFirstButtonReturn {
		//	print("OK button clicked")
		//} else {
		//	print("Cancel button clicked")
		//}
	}
	
	
	@IBAction func pressedColorButton(_ sender: NSButton) {
	}
	
}

