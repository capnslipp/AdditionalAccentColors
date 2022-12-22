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
		
		self.descriptionLabel.stringValue = ""
		
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
	
	
	@IBOutlet var descriptionLabel: NSTextField!
	
	
	var _selectedRadioButton: ColoredRadioButton!
	
	@IBAction func pressedColorButton(_ sender: ColoredRadioButton) {
		_selectedRadioButton = sender;
		self.descriptionLabel.stringValue = _selectedRadioButton.title;
		
		{
			switch _selectedRadioButton.title {
				case "Multicolor":
					$0.changeAccentColor(.multicolor)
				case "Blue":
					$0.changeAccentColor(.blue)
				case "Purple":
					$0.changeAccentColor(.purple)
				case "Pink":
					$0.changeAccentColor(.pink)
				case "Red":
					$0.changeAccentColor(.red)
				case "Orange":
					$0.changeAccentColor(.orange)
				case "Yellow":
					$0.changeAccentColor(.yellow)
				case "Green":
					$0.changeAccentColor(.green)
				case "Graphite":
					$0.changeAccentColor(.graphite)
				
				case "iMac Green":
					$0.changeAccentColor(.iMacGreen)
				case "iMac Yellow":
					$0.changeAccentColor(.iMacYellow)
				case "iMac Orange":
					$0.changeAccentColor(.iMacOrange)
				case "iMac Pink":
					$0.changeAccentColor(.iMacPink)
				case "iMac Purple":
					$0.changeAccentColor(.iMacPurple)
				case "iMac Blue":
					$0.changeAccentColor(.iMacBlue)
				
				default:
					print("Unimplemented for title \(_selectedRadioButton.title)")
			}
		}(ShellDefaultsRunner.self)
	}
	
}

