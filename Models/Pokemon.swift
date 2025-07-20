import Foundation

struct Pokemon: Identifiable, Decodable {
    let id: Int
    let name: String
    let sprites: Sprite
}

struct Sprite: Decodable {
    let front_default: String
}
//
//  Pokemon.swift
//  pokedex-ios
//
//  Created by Bárbara Letelier on 20-07-25.
//

