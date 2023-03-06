//
//  ContentView.swift
//  AnimeWatchList
//
//  Created by richard Haynes on 3/4/23.
//

import SwiftUI
import CoreData
/*
 https://www.youtube.com/watch?v=RGOJ2u87RQQ
 https://www.hackingwithswift.com/books/ios-swiftui/buttons-and-images
 https://stackoverflow.com/questions/66913755/xcode-swiftui-how-to-reset-canvas Useful for clearing preview data
 Actual command : xcrun simctl --set previews delete all
 */
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(fetchRequest: Anime.all,
        animation: .default)
    private var animes: FetchedResults<Anime>
    @State private var presented: Bool = false
    
    private func deleteAnime(indexSet: IndexSet){
        guard let index = indexSet.map( {$0}).first else {
            return
        }
        let anime = animes[index]
        do{
            try anime.delete()
        }
        catch {
            print(error)
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(animes) { anime in
                    NavigationLink {
                        Text("Name: " + anime.name!)
                        Text("Started: \(anime.dateStarted.toString())")
                        Text("Finished: \(anime.dateFinished.toString())")
                        NavigationLink(destination: SaveView(existingAnime: anime), label: {
                            Text("Edit")
                        })
                    } label: {
                        Text(anime.name ?? "")
                    }
                }.onDelete(perform: deleteAnime)
            }
            .navigationTitle("Anime To Watch ")
            .toolbar {
               
                ToolbarItem (placement: .navigationBarTrailing){
                    Button {
                        presented = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }.sheet(isPresented: $presented) {
                SaveView(existingAnime: nil)
            }
            Text("Select an item")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceProvider.preview.container.viewContext)
    }
}
