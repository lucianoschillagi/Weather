//
//  ViewController.swift
//  Todo1_prueba_técnica
//
//  Created by Luciano Schillagi on 15/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
	
	
	let darkSky = DarkSky()
	
	//*****************************************************************
	// MARK: - IBOutelts
	//*****************************************************************
	
	@IBOutlet weak var refreshButton: UIButton!
	@IBOutlet weak var timeZone: UILabel!
	@IBOutlet weak var icon: UILabel!
	@IBOutlet weak var temperature: UILabel!
	@IBOutlet weak var humidity: UILabel!
	@IBOutlet weak var humidityValue: UILabel!
	@IBOutlet weak var rain: UILabel!
	@IBOutlet weak var rainValue: UILabel!
	@IBOutlet weak var summary: UILabel!
	@IBOutlet weak var powered: UIImageView!
	

	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setUI()
		getWeatherInfo()
		
	}
	
	//*****************************************************************
	// MARK: - Networking Method
	//*****************************************************************
	
	func getWeatherInfo() {
		
		
		// MARK: summary info
		DarkSky.sharedInstance().getSummaryInfo { (success, summary, error) in
			
			print(success)
			performUIUpdatesOnMain {
				if success {
					self.summary.isHidden = false
					self.summary.text = summary
				} else {
					self.displayError(error)
				}
			}
		}
		
		// MARK: icon info
		DarkSky.sharedInstance().getIconInfo { (success, icon, error) in
			
			performUIUpdatesOnMain {
				if success {
					self.icon.isHidden = false
					self.icon.text = icon
				} else {
					self.displayError(error)
				}
			}
		}
		
		// MARK: temperature info
		DarkSky.sharedInstance().getTemperatureInfo { (success, temperature, error) in
			
			performUIUpdatesOnMain {
				if success {
					
					let temperatureInt = Int(temperature!)
					let temperatureString = String(temperatureInt)
					let temperatureWithPercent = temperatureString + "°"
					
					
					self.temperature.isHidden = false
					self.temperature.text = temperatureWithPercent
					
				} else {
					self.displayError(error)
				}
			}
		}
		
		
		
		// MARK: rain info
		DarkSky.sharedInstance().getRainInfo { (success, rain, error) in
			
			performUIUpdatesOnMain {
				if success {
					
					let rainPercent = rain! * 100
					let rainInt = Int(rainPercent)
					let rain = String(rainInt)
					let rainWithPercent = rain + "%"
					self.rainValue.isHidden = false
					self.rainValue.text = rainWithPercent
					
				} else {
					self.displayError(error)
				}
			}
		}
		
		
		// MARK: humidity info
		DarkSky.sharedInstance().getHumidityInfo { (success, humidity, error) in
			
			performUIUpdatesOnMain {
				if success {
					
					let humidityPercent = humidity! * 100
					let humidityInt = Int(humidityPercent)
					let humidity = String(humidityInt)
					let humdityWithPercent = humidity + "%"
					self.humidityValue.isHidden = false
					self.humidityValue.text = humdityWithPercent
					
				} else {
					self.displayError(error)
				}
			}
		}
		
		
		// MARK: timezone info
		DarkSky.sharedInstance().getTimeZoneInfo { (success, timeZone, error) in
			
			performUIUpdatesOnMain {
				if success {
					
					self.timeZone.isHidden = false
					self.timeZone.text = timeZone
					
				} else {
					self.displayError(error)
				}
			}
		}
		

	} // end func
	
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	@IBAction func refreshButton(_ sender: UIButton) {
	
		getWeatherInfo()
		print("new network request 🚀")
	}
	
	
	//*****************************************************************
	// MARK: - UI Config
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	func setUI() {

		//refreshButton.backgroundImage(for: UIControlState.reload)
		summary.isHidden = true
		icon.isHidden = true
		rainValue.isHidden = true
		temperature.isHidden = true
		humidityValue.isHidden = true
		timeZone.isHidden = true

	}
	

	
		func displayError(_ error: String?) {
			
			if error != nil {
	
				let alertController = UIAlertController(title: "Request Error", message: error, preferredStyle: .alert)
				
				let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
	
				}
				alertController.addAction(cancelAction)
				
				let OKAction = UIAlertAction(title: "OK", style: .default) { action in
				
				}
				alertController.addAction(OKAction)
				
				self.present(alertController, animated: true) {
				
				}
			}
		}

	


} // end class

