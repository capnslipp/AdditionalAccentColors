//
//  ShellDefaultsRunner.swift
//  AdditionalAccentColors
//
//  Created by Cap'n Slipp on 12/22/22.
//

import Foundation



struct ShellDefaultsRunner
{
	// MARK: Named Enums/Structs
	
	enum AccentColor : Int
	{
		case multicolor = -2
		case graphite = -1
		case red = 0
		case orange = 1
		case yellow = 2
		case green = 3
		case blue = 4
		case purple = 5
		case pink = 6
	}
	
	enum HardwareEnclosure : Int
	{
		case iMacOrange = 8
		case iMacYellow = 3
		case iMacGreen = 4
		case iMacBlue = 5
		case iMacPink = 6
		case iMacPurple = 7
	}
	
	
	// MARK: Change Via Named Enums/Structs
	
	static func changeAccentColor(_ accentColor: AccentColor) {
		changeAccentColor(number: accentColor.rawValue)
	}
	
	static func changeAccentColor(_ hardwareEnclosure: HardwareEnclosure) {
		changeSimulatedHardwareEnclosure(number: hardwareEnclosure.rawValue)
	}
	
	
	// MARK: Change Via Raw Value
	
	private static func changeAccentColor(number accentNumber: Int)
	{
		runDefaultsWriteCommand(key: "AppleAccentColor", value: accentNumber)
	}
	
	private static func changeSimulatedHardwareEnclosure(number enclosureNumber: Int)
	{
		runDefaultsDeleteCommand(key: "AppleAccentColor")
		runDefaultsWriteCommand(key: "NSColorSimulateHardwareAccent", value: true)
		runDefaultsWriteCommand(key: "NSColorSimulatedHardwareEnclosureNumber", value: enclosureNumber)
	}
	
	
	// MARK: Type Defaults Write Subcommand
	
	private static func runDefaultsWriteCommand(key: String, value: Int) {
		runDefaultsWriteCommand(key: key, type: "-int", value: "\(value)")
	}
	
	private static func runDefaultsWriteCommand(key: String, value: Bool) {
		runDefaultsWriteCommand(key: key, type: "-bool", value: "\(value ? "YES" : "NO")")
	}
	
	
	// MARK: Defaults Subcommands
	
	private static func runDefaultsWriteCommand(key: String, type: String, value: String)
	{
		let subcommand = "write"
		let domainArgument = "NSGlobalDomain"
		runDefaultsCommand(subcommand, domainArgument, key, type, value)
	}
	
	private static func runDefaultsDeleteCommand(key: String)
	{
		let subcommand = "delete"
		let domainArgument = "NSGlobalDomain"
		runDefaultsCommand(subcommand, domainArgument, key)
	}
	
	
	// MARK: Defaults Command
	
	private static func runDefaultsCommand(_ arguments: String...)
	{
		let executableURL = URL(fileURLWithPath: "/usr/bin/defaults")
		print("Running: \(executableURL) \(arguments.joined(separator: " "))")
		try! Process.run(executableURL, arguments: arguments, terminationHandler: nil)
	}
}
