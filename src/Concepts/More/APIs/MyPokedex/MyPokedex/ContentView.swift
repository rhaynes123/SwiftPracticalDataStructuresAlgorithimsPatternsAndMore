//
//  ContentView.swift
//  MyPokedex
//
//  Created by richard Haynes on 2/17/23.
//

import SwiftUI
// https://www.youtube.com/watch?v=r3O90QGKv98
// https://www.youtube.com/watch?v=CimY_Sr3gWw
// https://www.youtube.com/watch?v=Qk5s-6ldNfA
// https://developer.apple.com/documentation/swiftui/textfield
// https://www.youtube.com/watch?v=9QhhpeYKjOs
// https://wwdcbysundell.com/2021/using-async-await-with-urlsession/
//
struct ContentView: View {
    @StateObject var model = PokedexViewModel()
    @State var speciesList : [species] = []
    @State private var pokemonToSearch : String = ""
    var body: some View {
        NavigationView {
            List{
                TextField(text: $pokemonToSearch, prompt: Text("Enter Pokemon Name"))
                {
                    Text("Pokemon")
                }
                Button("Search"){
                    model.fetchPokemon(by: pokemonToSearch)
                }
                ScrollView {
                    ForEach(model.pokemonResults, id: \.self){ pokemon in
                       
                        HStack{
                            
                            let imageUrl = URL(string: pokemon.sprites.front_default)
                            AsyncImage(url: imageUrl)
                            
                            Text("#: \(pokemon.id) \(pokemon.name)").bold()
                            
                            ForEach(pokemon.types, id: \.self){
                                type in
                                Text(type.type.name)
                            }.onAppear() {
                                Task{
                                    let species = try await model.fetchPokemonSpecies(by: pokemon.species.url)
                                    self.speciesList.append(species!)
                                }
                            }
                            
                        }
                        .padding(4)
                        
                        HStack{
                            let flavortext = speciesList.first(where: {$0.name == pokemon.name})?.flavor_text_entries.first?.flavor_text ?? ""
                            Text("Description: \(flavortext)")
                        }
                    }
                }
            }
            .navigationTitle("Pokemon")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
