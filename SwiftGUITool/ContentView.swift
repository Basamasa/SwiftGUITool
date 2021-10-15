//
//  ContentView.swift
//  SwiftGUITool
//
//  Created by Anzer Arkin on 14.10.21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var swiftText = ""

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
                    
                    TextEditor(text: $swiftText)
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
