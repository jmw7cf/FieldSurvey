//
//  ViewController.swift
//  Field Survey
//
//  Created by Julia Wopata on 5/2/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let jsonFileName = "field_observations"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let fieldSet = FieldSurveyLoader.load(jsonFileName: jsonFilName) {
            var displayInfo = ""
            displayInfo += "Status: \(photoSet.status)\n"
            displayInfo += "Photos path: \(photoSet.photosPath)\n\n"
            for photo in photoSet.photos {
                displayInfo += "Photo:\n"
                displayInfo += "\(photo.title)\n"
                displayInfo += "\(photo.description)\n"
                displayInfo += "\(photo.date)\n"
                displayInfo += "\(photo.latitude)\n"
                displayInfo += "\(photo.longitude)\n"
                displayInfo += "\(photo.imageName)\n\n"
            }
            displayTextView.text = displayInfo
        } else {
            displayTextView.text = "Error."
        }
    }


}

