//
//  Post.swift
//  PostApp
//
//  Created by richard Haynes on 6/29/23.
//

import Foundation
struct Post : Codable, Identifiable {
    var id : Int
    var userId : Int
    var title : String
    var body : String
}
