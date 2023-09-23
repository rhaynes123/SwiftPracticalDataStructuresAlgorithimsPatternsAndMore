//
//  MainView.swift
//  DreamJournal
//
//  Created by richard Haynes on 9/23/23.
// https://www.youtube.com/watch?v=yM-0NPjuBzs
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
