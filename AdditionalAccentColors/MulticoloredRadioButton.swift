//
//  MulticoloredRadioButton.swift
//  AdditionalAccentColors
//
//  Created by Cap'n Slipp on 12/22/22.
//

import Cocoa



class MulticoloredRadioButton : ColoredRadioButton
{
	override var circleFillColor: NSColor {
		return NSColor.black
	}
	override var circleOutlineColor: NSColor {
		switch self.effectiveAppearance.name {
			case .darkAqua,
				.vibrantDark,
				.accessibilityHighContrastDarkAqua,
				.accessibilityHighContrastVibrantDark:
				return NSColor.highlightColor.withAlphaComponent(0.25)
			default:
				return NSColor.shadowColor.withAlphaComponent(0.25)
		}
	}
	
	override func draw(_ dirtyRect: NSRect)
	{
		{
			let circleRect = (self.bounds as CGRect).insetBy(dx: 1.5, dy: 1.5);
			self.circleFillColor.set()
			$0.fillEllipse(in: circleRect)
			
			$0.addEllipse(in: circleRect)
			$0.clip()
			
			let image = NSImage(named: "NSColorPanel")!
			let imageRect = CGRect(origin: CGPointZero, size: image.size)
			
			let imageSourceSize = CGSize(
				width: imageRect.size.width * 0.81,
				height: imageRect.size.height * 0.81
			);
			let imageSourceRect = CGRect(
				origin: CGPoint(
					x: imageRect.midPoint.x - (imageSourceSize.width / 2),
					y: imageRect.midPoint.y - (imageSourceSize.height / 2)
				),
				size: imageSourceSize
			)
			image.draw(
				in: circleRect,
				from: imageSourceRect,
				operation: .hardLight,
				fraction: 1.0,
				respectFlipped: true,
				hints: [:]
			)
			
			$0.resetClip()
			
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



extension CGRect
{
	var midPoint: CGPoint {
		CGPoint(x: self.midX, y: self.midY)
	}
}
