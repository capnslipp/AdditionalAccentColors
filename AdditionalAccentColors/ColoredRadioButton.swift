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
	
	
	@objc var color: NSColor!
	
	var circleFillColor: NSColor {
		self.color ?? self.contentTintColor ?? NSColor.controlAccentColor
	}
	var circleOutlineColor: NSColor {
		self.circleFillColor.highlight(withLevel: 0.5)!
	}
	
	let dotColor: NSColor = NSColor.white
	
	
	override func draw(_ dirtyRect: NSRect)
	{
		{
			//let circle = NSBezierPath(ovalIn: self.bounds)
			let circleRect = NSInsetRect(self.bounds, 1.0, 1.0);
			self.circleFillColor.set()
			$0.fillEllipse(in: circleRect)
			
			self.circleOutlineColor.set()
			$0.setLineWidth(1.0)
			$0.strokeEllipse(in: circleRect)
			
			if (self.state) == .on {
				let dotRect = NSInsetRect(self.bounds, 6.0, 6.0);
				//let dot = NSBezierPath(ovalIn: dotRect)
				self.dotColor.set()
				$0.fillEllipse(in: dotRect)
			}
		}(NSGraphicsContext.current!.cgContext)
	}
	
}
