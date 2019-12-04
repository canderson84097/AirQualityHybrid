//
//  StatesListViewController.swift
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class StatesListViewController: UIViewController {
    
    // MARK: - Properties
    
    var countryLanding: String?
    var states: [String] = [] {
        didSet {
            updateTableView()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let country = countryLanding else { return }
        
        CDAAirQualityController.fetchSupportedStates(inCountry: country, completion: { (states) in
            if let states = states {
                self.states = states
            }
        })
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesList" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? CitiesListViewController else { return }
            let chosenState = states[indexPath.row]
            destinationVC.stateLanding = chosenState
            destinationVC.country = countryLanding
        }
    }
    
    
    // MARK: - Custom Methods
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - Extensions

extension StatesListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        let state = states[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
}
