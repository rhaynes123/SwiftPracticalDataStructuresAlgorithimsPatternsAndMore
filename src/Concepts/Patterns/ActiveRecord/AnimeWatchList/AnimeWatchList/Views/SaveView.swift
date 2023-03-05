//
//  SaveView.swift
//  AnimeWatchList
//
//  Created by richard Haynes on 3/4/23.
//
/*
 https://www.youtube.com/watch?v=Utkdlpo8T6w
 https://www.youtube.com/watch?v=m0QQ-hWs8fc
 */

import SwiftUI
import CoreData
struct SaveView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var animeName : String = ""
    @State private var animeStartDate : Date = Date()
    @State private var animeFinishedDate : Date? = nil
    
    @State private var hasStarted : Bool = false
    @State private var hasFinished : Bool = false
    
    var existingAnime : Anime? = nil
    
    private func saveAnime(){
        let anime = Anime(context: viewContext)
        anime.id = UUID()
        anime.name = animeName
        anime.dateStarted = hasStarted ? animeStartDate : nil
        anime.dateFinished = hasFinished ? animeFinishedDate : nil
        do {
            try anime.save()
        }catch{
            print(error)
        }
    }
    
//    private func editAnime(){
//        guard let anime = existingAnime else {
//            return
//        }
//        anime.name = animeName
//        anime.dateStarted = hasStarted ? animeStartDate : nil
//        anime.dateFinished = hasFinished ? animeFinishedDate : nil
//        do {
//            try anime.save()
//        }catch{
//            print(error)
//        }
//    }
//
//    private func LoadExisting(){
//
//    }
    var body: some View {
        Form{
            TextField("Name", text: $animeName)
            DatePicker("Started", selection: $animeStartDate, displayedComponents: .date)
                .onChange(of: animeStartDate){ _ in
                hasStarted = true
            }
            //TextField("Finished", text: $animeFinishedDate)
            HStack{
                Button("Save"){
                    saveAnime()
                    dismiss()
                }
                Button("Cancel"){
                    dismiss()
                }
            }
        }
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView(existingAnime : nil)
    }
}
