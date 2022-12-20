//
//  AdditionalAccentColors.swift
//  AdditionalAccentColors
//
//  Created by Cap'n Slipp on 12/18/22.
//

import PreferencePanes

class PrefPane : NSPreferencePane {

	@IBOutlet weak var testTextField: NSTextField!
	
	override func mainViewDidLoad()
	{
		self.testTextField.stringValue = "It worked!"
		
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
	
}
