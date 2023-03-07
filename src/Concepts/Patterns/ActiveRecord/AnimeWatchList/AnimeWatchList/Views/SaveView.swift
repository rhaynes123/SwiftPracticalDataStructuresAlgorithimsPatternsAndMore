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
    @State private var model : SaveViewModel = SaveViewModel()
    @State var animeStartDate : Date = Date()
    @State var animeFinishedDate : Date = Date()
    @State var animeName : String = ""
    @Environment(\.dismiss) private var dismiss
   

    let existingAnime : Anime?
    
    // MARK Private Methods
    private func saveAnime(){
        if existingAnime != nil{
            model.editAnime(existingAnime: existingAnime)
        }
        else{
            model.createAnime()
        }
    }

    private func LoadExisting(){
        guard let currentAnime = existingAnime else {
            return
        }
        animeName = currentAnime.name ?? ""
        animeStartDate = currentAnime.dateStarted ?? Date()
        animeFinishedDate = currentAnime.dateFinished ?? Date()
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $animeName).onChange(of: animeName){newAnimeName in
                model.animeName = newAnimeName
            }
            DatePicker("Started", selection: $animeStartDate, displayedComponents: .date)
                .onChange(of: animeStartDate){ newStartDate in
                    model.animeStartDate = newStartDate
                    model.hasStarted = true
                }
            DatePicker("Finished", selection: $animeFinishedDate, displayedComponents: .date)
                .onChange(of: animeFinishedDate){ newFinishedDate in
                    model.animeFinishedDate = newFinishedDate
                    model.hasFinished = true
                }
            HStack(spacing: 170){
                Button("Save"){
                    saveAnime()
                    dismiss()
                }.buttonStyle(.borderedProminent)
                Button("Cancel", role: .cancel){
                    dismiss()
                }.buttonStyle(.borderedProminent)
            }
        }.onAppear{
            LoadExisting()
        }
    }
}

struct SaveView_Previews: PreviewProvider {
    static let anime = Anime(context:PersistenceProvider.preview.container.viewContext)
    static var previews: some View {
        SaveView(existingAnime: anime)
    }
}



