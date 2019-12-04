//
//  CityDetailViewController.swift
//  AirQualityHybrid
//
//  Created by Chris Anderson on 12/4/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {

    // MARK: - Properties
    
    var country: String?
    var state: String?
    var cityLanding: String?
    
    // MARK: - Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = cityLanding,
        let state = state,
        let country = country
            else { return }
        
        CDAAirQualityController.fetchData(forCity: city, state: state, country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
        }
    }
    
    // MARK: - Custom Methods
    
    func updateViews(with details: CDACityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = details.city
            self.stateNameLabel.text = details.state
            self.countryNameLabel.text = details.country
            self.temperatureLabel.text = "\(details.weather.temperature)"
            self.humidityLabel.text = "\(details.weather.humidity)"
            self.aqiLabel.text = "\(details.pollution.airQualityIndex)"
            self.windSpeedLabel.text = "\(details.weather.windSpeed)"
        }
    }
}
