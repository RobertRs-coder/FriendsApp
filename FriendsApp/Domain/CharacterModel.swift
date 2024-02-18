//
//  CharacterModel.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import Foundation

typealias CharactersModel = [CharacterModel]

struct CharacterModel {
    var image: String?
    var name: String
    var lastname: String
    var score: Float = 0.0
}

let sampleCharactersData: CharactersModel = [
    CharacterModel(image: "img_rachel",
                   name: "Rachel",
                   lastname: "Green",
                   score: 10.0),
    CharacterModel(image: "img_ross",
                   name: "Ross",
                   lastname: "Geller",
                   score: 9.5),
    CharacterModel(image: "img_monica",
                   name: "Monica",
                   lastname: "Geller",
                   score: 9.0),
    CharacterModel(image: "img_joey",
                   name: "Joey",
                   lastname: "Trtibbiani",
                   score: 8.5),
    CharacterModel(image: "img_chandler",
                   name: "Chandler",
                   lastname: "Bing",
                   score: 8.0),
    CharacterModel(image: "img_phoebe",
                   name: "Phoebe",
                   lastname: "Buffay",
                   score: 7.5),
]
