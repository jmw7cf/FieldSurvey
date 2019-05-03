//
//  FieldSurveyLoader.swift
//  Field Survey
//
//  Created by Julia Wopata on 5/2/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import Foundation

class FieldSurveyLoader {
    
    class func load(jsonFileName: String) -> FieldSet? {
        var fieldSet: FieldSet?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            fieldSet = try? jsonDecoder.decode(FieldSet.self, from: jsonData)
        }
        
        return fieldSet
    }
}
