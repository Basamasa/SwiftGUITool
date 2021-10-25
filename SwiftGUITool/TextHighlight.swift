//
//  TextHighlight.swift
//  SwiftGUITool
//
//  Created by Aierken Ainizhaer on 21.10.21.
//

import Foundation
import HighlightedTextEditor

class TextHighlight {
		
	static func createPattern(word: String) -> NSRegularExpression {
		let pattern = "\\b"+NSRegularExpression.escapedPattern(for: word)+"\\b"
		
		return try! NSRegularExpression(pattern: pattern, options: [])
	}
	
	static func stringPattern() -> NSRegularExpression {
		return try! NSRegularExpression(pattern: "\"[^_]+\"", options: [])
	}
	
	static func highlightRuleRed(_ word: String) -> HighlightRule {
		return HighlightRule(pattern: createPattern(word: word), formattingRules: [
			TextFormattingRule(fontTraits: [.bold]),
			TextFormattingRule(key: .foregroundColor, value: NSColor.magenta)
		])
	}
	
	static func ruleDeleteUnusedCode() -> NSRegularExpression {
		return createPattern(word: "Failed to open macho file at /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift for reading: Too many levels of symbolic links")
	}
	
	static let ruleString: [HighlightRule] = [
		HighlightRule(pattern: stringPattern(), formattingRules: [
			TextFormattingRule(fontTraits: [.bold]),
			TextFormattingRule(key: .foregroundColor, value: NSColor.orange)
		]),
	]
		
	static let rule1: [HighlightRule] = [
		highlightRuleRed("int"),highlightRuleRed("static"),
		highlightRuleRed("func"),highlightRuleRed("class"),
		highlightRuleRed("let"),highlightRuleRed("var"),
		highlightRuleRed("do"),highlightRuleRed("catch"),
		highlightRuleRed("if"),highlightRuleRed("else"),
		highlightRuleRed("for"),highlightRuleRed("true"),
		highlightRuleRed("false"),highlightRuleRed("float"),
		highlightRuleRed("long")
	]
	
}
