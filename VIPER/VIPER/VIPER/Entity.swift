//
//  Entity.swift
//  VIPER
//
//  Created by Neosoft on 26/06/26.
//

import Foundation

// Model

struct Products: Codable {
    let products : [Product]
    
}

struct Product: Codable {
    let title: String
}
