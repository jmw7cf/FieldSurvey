//
//  FieldObservationLoader.swift
//  Field Survey
//
//  Created by Julia Wopata on 5/2/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import Foundation

class FieldObservationLoader {
    
    class func load(jsonFileName: String) -> FieldObservationSet? {
        var observationSet: FieldObservationSet?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            observationSet = try? jsonDecoder.decode(FieldObservationSet.self, from: jsonData)
        }
        
        return observationSet
    }
}
