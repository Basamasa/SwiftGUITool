@_private(sourceFile: "ContentView.swift") import SwiftGUITool
import CoreData
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/Anzer/Documents/SwiftGUITool/SwiftGUITool/ContentView.swift", line: 81)
        __designTimeSelection(ContentView().environment(\.managedObjectContext, __designTimeSelection(PersistenceController.preview.container.viewContext, "#917.[4].[0].property.[0].[0].modifier[0].arg[1].value")), "#917.[4].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: deleteItems(offsets:)) private func __preview__deleteItems(offsets: IndexSet) {
        #sourceLocation(file: "/Users/Anzer/Documents/SwiftGUITool/SwiftGUITool/ContentView.swift", line: 57)
        __designTimeSelection(withAnimation {
            __designTimeSelection(offsets.map { __designTimeSelection(items[__designTimeSelection($0, "#917.[2].[4].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].[0].value")], "#917.[2].[4].[0].arg[0].value.[0].modifier[0].arg[0].value.[0]") }.forEach(__designTimeSelection(viewContext.delete, "#917.[2].[4].[0].arg[0].value.[0].modifier[1].arg[0].value")), "#917.[2].[4].[0].arg[0].value.[0]")

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }, "#917.[2].[4].[0]")
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: addItem()) private func __preview__addItem() {
        #sourceLocation(file: "/Users/Anzer/Documents/SwiftGUITool/SwiftGUITool/ContentView.swift", line: 41)
        __designTimeSelection(withAnimation {
            let newItem = Item(context: __designTimeSelection(viewContext, "#917.[2].[3].[0].arg[0].value.[0].value.arg[0].value"))
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }, "#917.[2].[3].[0]")
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/Anzer/Documents/SwiftGUITool/SwiftGUITool/ContentView.swift", line: 20)
        __designTimeSelection(NavigationView {
            __designTimeSelection(List {
                __designTimeSelection(ForEach(__designTimeSelection(items, "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value")) { item in
                    __designTimeSelection(NavigationLink(destination: __designTimeSelection(Text("Item at \(item.timestamp!, formatter: __designTimeSelection(itemFormatter, "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.arg[0].value.[1].value.arg[1].value"))"), "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value")) {
                        __designTimeSelection(Text(item.timestamp!, formatter: __designTimeSelection(itemFormatter, "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[1].value")), "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0]")
                    }, "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0]")
                }
                .onDelete(perform: __designTimeSelection(deleteItems, "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value")), "#917.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
            }
            .toolbar {
                __designTimeSelection(ToolbarItem {
                    __designTimeSelection(Button(action: __designTimeSelection(addItem, "#917.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0].arg[0].value")) {
                        __designTimeSelection(Label(__designTimeString("#917.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Add Item"), systemImage: __designTimeString("#917.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value", fallback: "plus")), "#917.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0]")
                    }, "#917.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0]")
                }, "#917.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0]")
            }, "#917.[2].[2].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(Text(__designTimeString("#917.[2].[2].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Select an item")), "#917.[2].[2].property.[0].[0].arg[0].value.[1]")
        }, "#917.[2].[2].property.[0].[0]")
    #sourceLocation()
    }
}

import struct SwiftGUITool.ContentView
import struct SwiftGUITool.ContentView_Previews