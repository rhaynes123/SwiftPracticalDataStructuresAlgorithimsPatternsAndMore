//
//  SaveViewModel.swift
//  AnimeWatchList
//
//  Created by richard Haynes on 3/5/23.
//

import Foundation
import CoreData
final class SaveViewModel : ObservableObject {

    @Published var animeName : String = ""
    @Published var animeStartDate : Date = Date()
    @Published var animeFinishedDate : Date = Date()
    @Published var hasStarted : Bool = false
    @Published var hasFinished : Bool = false
    
    private var context: NSManagedObjectContext = PersistenceProvider.shared.container.viewContext
    
    func createAnime(){
        if animeName == "" {
            return
        }
        let anime = Anime(context: context)
        anime.id = UUID()
        anime.name = animeName
        anime.dateStarted = hasStarted ? animeStartDate : nil
        do {
            try anime.save()
        }catch{
            print(error)
        }
    }
    
    func editAnime(existingAnime: Anime?){
        guard let anime = existingAnime else {
            return
        }
        anime.id = existingAnime?.id
        anime.name = animeName
        anime.dateStarted = hasStarted ? self.animeStartDate : nil
        anime.dateFinished = hasFinished ? animeFinishedDate : nil
        do {
            try anime.save()
        }catch{
            print(error)
        }
    }
    
   
}
