//
//  Pokemon.swift
//  MyPokedex
//
//  Created by richard Haynes on 2/17/23.
//
// https://app.quicktype.io
import Foundation

struct Pokemon: Hashable, Codable {
    let sprites : Sprites
    let id: Int
    let name: String
    let types : [Types]
    let species : Species
}

struct Sprites: Codable, Hashable{
    let front_default: String
}

struct Species: Codable, Hashable {
    let name: String
    let url: String
}

struct type: Codable, Hashable {
    let name: String
    let url: String
}

struct Types: Codable, Hashable{
    let slot : Int
    let type : type
}

struct species: Codable, Hashable{
    let name: String
    let flavor_text_entries: [FlavorText]
}

struct FlavorText: Codable, Hashable{
    let flavor_text: String
}
