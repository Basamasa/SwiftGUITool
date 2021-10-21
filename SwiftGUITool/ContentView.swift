//
//  ContentView.swift
//  SwiftGUITool
//
//  Created by Anzer Arkin on 14.10.21.
//

import SwiftUI
import CoreData
import HighlightedTextEditor

let betweenUnderscores = try! NSRegularExpression(pattern: "_[^_]+_", options: [])

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
	
	@Environment(\.colorScheme) var colorScheme

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    	
	@State private var swiftText: String = ""
		
	private let rules: [HighlightRule] = [
		HighlightRule(pattern: betweenUnderscores, formattingRules: [
			TextFormattingRule(fontTraits: [.bold]),
			TextFormattingRule(key: .foregroundColor, value: NSColor.red),
			TextFormattingRule(key: .underlineStyle) { content, range in
				if content.count > 10 { return NSUnderlineStyle.double.rawValue }
				else { return NSUnderlineStyle.single.rawValue }
			}
		])
	]
	
    var body: some View {
        NavigationView {
			
            List {
            }
            .toolbar {
                ToolbarItem {
                    Button(action: runCode) {
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
						.onCommit { print("commited") }
						.onEditingChanged { print("editing changed") }
						.onTextChange { print("latest text value", $0) }
						.onSelectionChange { (range: NSRange) in
							print(range)
						}
						.introspect { editor in
							// access underlying UITextView or NSTextView
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
                    Text("Output")
                        .fontWeight(.bold)
                    
                    Text(getAttributedString(swiftText))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                        .background(Color(.secondaryLabelColor))
                        .cornerRadius(16)
                        .padding(.bottom, 16)
                }
            }
            .font(.title2)
            .padding()
        }
    }
    
    func getAttributedString(_ markdown: String) -> String {
        return markdown
    }

    private func runCode() {
        withAnimation {
            
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
