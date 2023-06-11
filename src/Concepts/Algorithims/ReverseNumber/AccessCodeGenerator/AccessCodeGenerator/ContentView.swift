//
//  ContentView.swift
//  AccessCodeGenerator
//
//  Created by richard Haynes on 6/11/23.
//
//https://www.tutorialspoint.com/swift-program-to-reverse-a-number
// https://www.thomashanning.com/swiftui-alert/
// https://cocoacasts.com/swift-fundamentals-how-to-convert-a-date-to-a-string-in-swift
import SwiftUI

struct ContentView: View {
    @State private var displayAlert = false
    @State private var generatedNumber : String = ""
    private func GenerateSequenceNumber(){
        let rand = Int.random(in: 1..<100)
        let date = currentDateAsString()
        let reversedNum = reverseNumber()
        
        generatedNumber = "\(reversedNum)\(rand)\(date)"
    }
    
    private func reverseNumber()->Int {
        var seed = 123445
        var reversedNum = 0
        while(seed != 0){
            reversedNum = reversedNum * 10
            let lastDigitOfSeed = seed % 10
            reversedNum = reversedNum + lastDigitOfSeed
            seed = seed/10
        }
       return reversedNum
    }
    
    private func currentDateAsString() -> String {
        let date = Date()
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YYMMddHHmmss"

        // Convert Date to String
        let formattedResult = dateFormatter.string(from: date)
        return formattedResult
    }
    var body: some View {
        
        Button("Get Code"){
            GenerateSequenceNumber()
            displayAlert = true
        }.buttonStyle(.bordered)
        .alert(isPresented: $displayAlert){
            Alert(title: Text("Your Code Is"),
                message: Text(generatedNumber))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
