//
//  MenuViewModel.swift
//  SnackBar
//
//  Created by richard Haynes on 2/12/23.
//
// https://stackoverflow.com/questions/32505544/how-to-include-emoticons-in-swift-string
// "ctrl + cmd + space" will pop up the emoji keyboard
import Foundation
final class MenuViewModel {
    static var Snacks : [Snack] = [
        Snack(Name: "Pop", Price: 2.00, Image: "🥤"),
        Snack(Name: "Popcorn", Price: 3.00, Image: "🍿"),
        Snack(Name: "Pizza", Price: 5.00, Image: "🍕")
    ]
}
