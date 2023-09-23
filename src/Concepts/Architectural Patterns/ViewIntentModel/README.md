# View Intent Model
The View Intent Model or Model View Intent pattern is much like MVVM or MVC in that this pattern consistents of using Views to handle presentation of code and a model to represent our data. The difference with this pattern relies on the use of [AppIntents](https://developer.apple.com/documentation/appintents/app-intents). 

The app intents can be thought of as a datatype to represent that a piece of code should perform some type of action based of the data it is provided. These particular actions are encapsulated adding a high degree of reusability when multiple view need to perform an action or removing business logic out of a view altogether. The samples below are from a Dream Journal style application.

```Swift

import Foundation
import SwiftData
@Model
final class Dream {
    var note : String
    var dateTime : Date
    
    init(note: String, dateTime: Date) {
        self.note = note
        self.dateTime = dateTime
    }
}

```

```Swift

import Foundation
import AppIntents
import SwiftData

struct AddDreamIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Log Dream"
    
    @Parameter(title: "Note")
    var note: String
    @Parameter(title: "Date")
    var date: Date
    
    init(note: String, date: Date) {
        self.note = note
        self.date = date
    }
    
    init() {
        self.note = "None"
    }
    @MainActor
    func perform() async throws -> some IntentResult {
        guard let modelContext = try? ModelContainer(for: Dream.self).mainContext else {
            return .result()
        }
        let dream = Dream(note: note, dateTime: date)
        modelContext.insert(dream)
        return .result()
    }
    
}
```

```Swift

import Foundation

import AppIntents
import SwiftData
struct DeleteDreamIntent : AppIntent {
    
    static var title: LocalizedStringResource = "Remove Dream"
    
    var offsets: IndexSet
    var dreams : [Dream]
    var context: ModelContext?
    
    init(offsets: IndexSet, dreams : [Dream], context: ModelContext) {
        self.offsets = offsets
        self.dreams = dreams
        self.context = context
    }
    
    init() {
        self.offsets = []
        self.dreams = []
        self.context = nil
    }
    
    @MainActor
    func perform() async throws -> some IntentResult {
        guard let modelContext = self.context else {
            return .result()
        }
        for index in offsets {
            modelContext.delete(dreams[index])
        }
        return .result()
    }
}
```

```Swift

import AppIntents
import SwiftUI
import SwiftData
struct MainView: View {
    @Environment(\.modelContext) private var context
    @Query(animation: .bouncy) var dreams : [Dream]
    @State var showSheet : Bool = false
    @State var dreamNote : String = ""
    @State var dreamDate : Date = Date()
    
    // Mark - Private functions
    
    private func AddDream() {
        Task {
            do {
                let intent = AddDreamIntent(note: dreamNote, date: dreamDate)
                _ = try await intent.perform()
            }
            
        }
    }
    private func deleteDreams(offsets: IndexSet) {
        Task {
            do {
                let intent = DeleteDreamIntent(offsets: offsets, dreams: self.dreams, context: self.context)
                _ = try await intent.perform()
            }
            
        }
    }
    var body: some View {
        Text("My Dreams").font(.title)
        NavigationStack {
            List {
                ForEach(dreams) { dream in
                    Text("\(dream.dateTime ) \(dream.note)")
                }.onDelete(perform: deleteDreams)
            }.navigationTitle("Dreams")
                .toolbar {
                    Button("Record Dream") {
                        showSheet.toggle()
                    }
                }.sheet(isPresented: $showSheet){
                    NavigationStack {
                        Form {
                            TextField("Add Note", text: $dreamNote)
                            DatePicker("Date", selection: $dreamDate)
                            Button("Add") {
                                AddDream()
                                showSheet.toggle()
                            }
                        }.navigationTitle("Add new Dream")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                Button("Cancel"){
                                    showSheet.toggle()
                                }
                            }
                    }
                    
                }.presentationDetents([.height(200)])
        }
    }
}

#Preview {
    MainView().modelContainer(for: Dream.self, inMemory: true)
}

```