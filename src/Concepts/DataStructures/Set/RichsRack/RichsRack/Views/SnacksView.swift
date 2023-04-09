//
//  ContentView.swift
//  RichsRack
//
//  Created by richard Haynes on 4/8/23.
//

import SwiftUI
/* Helpful Links
 https://developer.apple.com/documentation/swift/set/sorted()
 https://www.youtube.com/watch?v=sZV-rFS_GhM
 https://www.youtube.com/watch?v=IV0g9MyiW5Q
 https://www.youtube.com/watch?v=hMZdRduyA_4&t=884s
 https://developer.apple.com/documentation/swift/set/first(where:)
 https://forums.swift.org/t/string-isequal-case-insensitive/53633/7
 https://www.youtube.com/watch?v=gCzOhZ_LUps&t=238s
 https://www.youtube.com/watch?v=GzyhY5U-wpM
 */

struct SnacksView: View {
    @StateObject private var model = SnacksViewModel()
    var body: some View {
        NavigationView{
            List{
                /*
                 This sorting will put the list in alphabetical order.
                 The < is overloaded to compare the string property of the snack name.
                 Example B is less than A because it comes after A in the english Alphabet.
                    
                 */
                ForEach(Category.all, id: \.rawValue){ category in
                    Section(header: Text(category.rawValue).font(.title)){
                        ForEach(model.filteredSnacks.sorted(by: <), id: \.Id){ snack in
                            if snack.Category == category {
                                NavigationLink {
                                    Text("Name: \(snack.Name)")
                                    Text("Price: "+"$ \(snack.Price)")
                                } label: {
                                    Text("\(snack.Name)")
                                }
                            }
                        }
                    }
                }
            }.searchable(text: $model.snackName)
                .onChange(of: model.snackName, perform: model.searchSnacks)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SnacksView()
    }
}
