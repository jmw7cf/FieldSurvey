//
//  FieldSet.swift
//  Field Survey
//
//  Created by Julia Wopata on 5/2/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import Foundation

struct FieldSet: Codable {
    var status: String
    var observations: [FieldItem]
    
    enum CodingKeys: String, CodingKey {
        case status
        case observations
    }
}

struct FieldItem: Codable {
    var imageName: String
    var title: String
    var description: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case imageName = "image"
        case amphibian
        case bird
        case fish
        case insect
        case mammal
        case plant
        case reptile
    }
}

