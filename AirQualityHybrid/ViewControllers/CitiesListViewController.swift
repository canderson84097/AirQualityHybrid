//
//  CitiesListViewController.swift
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    
    // MARK: - Properties
    
    var stateLanding: String?
    var country: String?
    var cities: [String] = [] {
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
        
        guard let state = stateLanding,
            let country = country else { return }
        CDAAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            if let cities = cities {
                self.cities = cities
            }
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let country = country,
                let state = stateLanding,
                let destinationVC = segue.destination as? CityDetailViewController else { return }
            let chosenCity = cities[indexPath.row]
            destinationVC.cityLanding = chosenCity
            destinationVC.state = state
            destinationVC.country = country
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

extension CitiesListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city
        return cell
    }
}
