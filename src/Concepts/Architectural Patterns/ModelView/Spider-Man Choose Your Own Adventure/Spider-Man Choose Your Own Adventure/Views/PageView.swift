//
//  PageView.swift
//  Spider-Man Choose Your Own Adventure
//
//  Created by richard Haynes on 9/13/23.
//

import SwiftUI

struct PageView: View {
    let story: Story
    let pageNumber: Int
    private let radius: CGFloat = 10
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                BackGroundImageView(imageName: "spiderman-headshot")
                
                VStack {
                    ScrollView {
                        Text(story[pageNumber].text)
                            .foregroundColor(.white)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .background(.ultraThinMaterial.opacity(0.9))
                            .shadow(color: Color.black, radius: radius)
                    }.frame(width: 350, height: 300)
                    
                    ForEach(story[pageNumber].choices, id: \Choice.text) { choice in
                        NavigationLink(destination: PageView(story: story, pageNumber: choice.destinationPage)) {
                            Text(choice.text)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.blue.opacity(0.45))
                                .cornerRadius(radius)
                                .shadow(color: Color.black, radius: radius)
                        }
                    }
                }
                .padding()
                .navigationTitle("Page \(pageNumber)")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}


struct BackGroundImageView : View {
    var imageName : String
    init(imageName: String) {
        self.imageName = imageName
    }
    var body : some View {
        Image(imageName)
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all)
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(story: previewStory, pageNumber: 1)
    }
}
