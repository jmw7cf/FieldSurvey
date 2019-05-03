//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Julia Wopata on 5/2/19.
//  Copyright © 2019 Julia Wopata. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let jsonFileName = "field_observations"
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    let dateFormatter = DateFormatter()
    
    var observationSet: FieldObservationSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        observationSet = FieldObservationLoader.load(jsonFileName: jsonFileName)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (observationSet?.observations.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        tableView.rowHeight = 60
        if let cell = cell as? FieldSurveyTableViewCell , let fieldSurvey = observationSet?.observations[indexPath.row] {
            cell.nameLabel.text = fieldSurvey.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            cell.iconImageView.image = UIImage(named: fieldSurvey.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let row = fieldSurveyTableView.indexPathForSelectedRow?.row {
            destination.fieldSurvey = observationSet?.observations[row]
        }
    }
    
}
