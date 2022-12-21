//
//  ColoredRadioButton.swift
//  PrefPane
//
//  Created by Cap'n Slipp on 12/20/22.
//

import Cocoa



class ColoredRadioButton: NSButton
{
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	
	var color: NSColor {
		var value = self.contentTintColor ?? NSColor.controlAccentColor
		if value.type == .catalog {
			value = value.usingType(.componentBased)!
		}
		value = value.usingColorSpace(.sRGB)!
		return value
	}
	
	var circleFillColor: NSColor {
		self.color
	}
	var circleOutlineColor: NSColor {
		self.circleFillColor.withSystemEffect(.pressed)
	}
	
	let dotColor: NSColor = NSColor.white
	
	
	override func draw(_ dirtyRect: NSRect)
	{
		{
			let circleRect = NSInsetRect(self.bounds, 1.5, 1.5);
			
			self.circleFillColor.set()
			$0.fillEllipse(in: circleRect)
			
			self.circleOutlineColor.set()
			$0.setLineWidth(1.0)
			$0.strokeEllipse(in: circleRect)
			
			if (self.state) == .on {
				let dotRect = NSInsetRect(self.bounds, 6.0, 6.0);
				
				self.dotColor.set()
				$0.fillEllipse(in: dotRect)
			}
		}(NSGraphicsContext.current!.cgContext)
	}
	
}
