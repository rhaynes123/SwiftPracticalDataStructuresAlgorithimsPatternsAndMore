//
//  MainView.swift
//  Spider-Man Choose Your Own Adventure
//
//  Created by richard Haynes on 9/13/23.
//

import SwiftUI
struct MainView: View {
    var adventure : Adventure = Adventure.preview
    private let radius: CGFloat = 10
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackGroundImageView(imageName: "spiderman-headshot")
                
                VStack {
                    Text("Spider-man Choose Your Own Path")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Text("A Tale From the Marvel Cinamatic Universe")
                        .font(.headline)
                        .foregroundColor(.white)
                    if adventure.story.pages.isEmpty {
                        showErrorAlertView(errorMessage: "Pages Not Found")
                    }
                    else {
                        NavigationLink(destination: PageView(story: adventure.story, pageNumber: 3)) {
                            Text("Start Story").foregroundColor(.white)
                        }
                        .buttonStyle(ChoiceButtonStyle(backGroundColor: .blue, radius: radius))
                        .shadow(color: Color.black.opacity(0.3), radius: radius)
                    }
                    
                }
            }
        }
        
    }
    // MARK - Private Methods
    private func showErrorAlertView(errorMessage : String = "Oooops something went wrong") -> some View {
        
        return VStack {
            
        }.alert(isPresented: .constant(true)) {
            Alert(title: Text(errorMessage))
        }
    }
}

struct ChoiceButtonStyle : ButtonStyle {
    var backGroundColor : Color
    var radius : CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backGroundColor)
            .foregroundColor(.white)
            .cornerRadius(radius)
            .font(.headline)
            .shadow(color: Color.black, radius: radius)
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
