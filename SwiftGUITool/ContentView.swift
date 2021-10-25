//
//  ContentView.swift
//  SwiftGUITool
//
//  Created by Anzer Arkin on 14.10.21.
//

import SwiftUI
import CoreData
import HighlightedTextEditor
import Cocoa
import Foundation

let searchPattern = "\\b"+NSRegularExpression.escapedPattern(for: "int")+"\\b"

let betweenUnderscores = try! NSRegularExpression(pattern: searchPattern, options: [])

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
	
	@Environment(\.colorScheme) var colorScheme

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    	
	@State private var swiftText: String = ""
	
	@State private var output: String = ""
		
	private let rules: [HighlightRule] = TextHighlight.rule1 + TextHighlight.ruleString
	
	func onEditingChanged() {
		print("editing changed")
		
	}
	
	func onTextChange() {
		print("latest text value", swiftText)
	}
	
	func onSelectionChange(range: NSRange) {
		print(range)
	}
	
	func onCommit() {
		print("commited")
	}
	
    var body: some View {
        NavigationView {
			
            List {
				Button(action: switchFile) {
					Text("swiftText.swift")
				}
				.buttonStyle(PlainButtonStyle())
            }
            .toolbar {
                ToolbarItem {
					Button(action: run) {
                        Label("Run", systemImage: "play.fill")
                    }
                }
            }
			
            HStack {
				VStack {
					Text("Swift script")
						.fontWeight(.bold)
					HighlightedTextEditor(text: $swiftText, highlightRules: rules)
						// optional modifiers
						.onCommit { onCommit() }
						.onEditingChanged { onEditingChanged() }
						.onTextChange { _ in onTextChange() }
						.onSelectionChange { (range: NSRange) in
							onSelectionChange(range: range)
						}
						.introspect { editor in
							if colorScheme == .dark {
								editor.textView.backgroundColor = .black
							} else {
								editor.textView.backgroundColor = .white
							}
						}
						.frame(width: 400)
						.padding()
						.background(Color(.secondaryLabelColor))
						.cornerRadius(16)
						.padding(.bottom, 16)
				}
                
                VStack {
					HStack{
						Text("Output")
							.fontWeight(.bold)
						Button(action: {
							output = ""
						}) {
							Image(systemName: "trash")
						}
						.buttonStyle(PlainButtonStyle())
					}
					ScrollView {
						TextField("", text: .constant(output)) 
							.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
							.padding()
							.background(Color(.secondaryLabelColor))
							.cornerRadius(16)
							.padding(.bottom, 16)
					}
				}
            }
            .font(.title2)
            .padding()
        }
    }
    
    func getAttributedString(_ markdown: String) -> String {
        return markdown
    }

	private func switchFile() {
		
	}
	
	private func run () {
		safeFile()
		// Go to Documents, then change file permission, then run the swift file
		shell(["cd Users/" + NSUserName() + "/Documents" + "&& chmod 755 swiftText.swift && ./swiftText.swift"])
	}
	
    private func safeFile() {
		var safedText = ""
		// get URL to the the documents directory in the sandbox
		let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0] as NSURL

		// add a filename
		let fileUrl = documentsUrl.appendingPathComponent("swiftText.swift")

		safedText = "#!/usr/bin/env swift \n" + swiftText
		// write to it
		try! safedText.write(to: fileUrl!, atomically: true, encoding: String.Encoding.utf8)
    }
	
	private func shell(_ args: [String]) {
		let task = Process()
		let pipe = Pipe()
		  
		task.standardOutput = pipe
		task.standardError = pipe
		task.arguments = ["-c"]
		task.arguments = task.arguments! + args
		task.launchPath = "/bin/bash/"
		task.launch()
		  
		let data = pipe.fileHandleForReading.readDataToEndOfFile()
		var output = String(data: data, encoding: .utf8)!
		  
		print(output)
		let regex = TextHighlight.ruleDeleteUnusedCode()
		
		let machedOutputs = regex.matches(in: output, range: NSRange(output.startIndex..., in: output)).map{String(output[Range($0.range, in: output)!])}
				
		if let range = output.range(of: machedOutputs[0]) {
			output.removeSubrange(range)
		}
		self.output += output
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
