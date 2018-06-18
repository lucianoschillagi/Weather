//
//  DarkSkyClient.swift
//  Todo1_prueba_técnica
//
//  Created by Luciano Schillagi on 16/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation

/*
Abstract:
...
*/

// MARK: - Dark Sky API Client

class DarkSky : NSObject {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	let session = URLSession.shared
	

	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init() {
		super.init()
	}

	//*****************************************************************
	// MARK: - Netwoking Methods 🚀
	//*****************************************************************
	
	func getSummaryInfo(_ completionHandlerForGetSummaryInfo: @escaping ( _ success: Bool, _ summary: String?, _  errorString: String?) -> Void) {
		
		
		// Step-1: Build the URL
		let request = NSMutableURLRequest(url: url())
		
		// Step-2: Make the request
		let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
			
			
			/// ERROR ///////////////////////////////////////////////////////////////////////////////////////////////////////
			// if an error occurs, print it
			func displayError(_ error: String) {
				print(error)
				
			}
			
			/// GUARD ///////////////////////////////////////////////////////////////////////////////////////////////////////
			/* GUARD: Was there an error? */
			guard (error == nil) else {
				displayError("There was an error with your request: \(error!)")
				return
			}
			
			/* GUARD: Did we get a successful 2XX response? */
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
				displayError("Your request returned a status code other than 2xx!")
				return
			}
			
			/* GUARD: Was there any data returned? */
			guard let data = data else {
				displayError("No data was returned by the request!")
				return
			}
			
			
			
			/// PARSE THE DATA ///////////////////////////////////////////////////////////////////////////////////////////////
			let parsedResult: [String:AnyObject]!
			do {
				parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
			} catch {
				displayError("Could not parse the data as JSON: '\(data)'")
				return
			}
			
			
			//// CHECK and EXTRACT DESIRE VAULES //////////////////////////////////////////////////////////////////////////////
			
			/* GUARD: Did Dark Sky return a parsedResult (stat != ok)? */
			guard let currently = parsedResult[Constants.JSONKeys.Currently] as? [String:AnyObject]  else {
				displayError("Dark Sky API returned an error. See error code and message in \(parsedResult)")
				return
			}
		
		
			/* 3. Send the desired value(s) to completion handler */
			
			// summary key
			if let error = error {
				print(error)
				completionHandlerForGetSummaryInfo(false, nil, "error")
				
			} else {
				if let summary = currently [Constants.JSONKeys.Summary] as? String {
					completionHandlerForGetSummaryInfo(true, summary, nil)
					
					print("sssss\(summary)")
				} else {
					print("no se encontró el valor ´summary´")
					completionHandlerForGetSummaryInfo(false, nil, "error")
				}
			}

		}
			
			task.resume()
		
	}
	
	
	func getIconInfo(_ completionHandlerForGetIconInfo: @escaping ( _ success: Bool, _ icon: String?, _  errorString: String?) -> Void) {
		
		
		// Step-1: Build the URL
		let request = NSMutableURLRequest(url: url())
		
		// Step-2: Make the request
		let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
			
			
			/// ERROR ///////////////////////////////////////////////////////////////////////////////////////////////////////
			// if an error occurs, print it
			func displayError(_ error: String) {
				print(error)
				
			}
			
			/// GUARD ///////////////////////////////////////////////////////////////////////////////////////////////////////
			/* GUARD: Was there an error? */
			guard (error == nil) else {
				displayError("There was an error with your request: \(error!)")
				return
			}
			
			/* GUARD: Did we get a successful 2XX response? */
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
				displayError("Your request returned a status code other than 2xx!")
				return
			}
			
			/* GUARD: Was there any data returned? */
			guard let data = data else {
				displayError("No data was returned by the request!")
				return
			}
			
			
			
			/// PARSE THE DATA ///////////////////////////////////////////////////////////////////////////////////////////////
			let parsedResult: [String:AnyObject]!
			do {
				parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
			} catch {
				displayError("Could not parse the data as JSON: '\(data)'")
				return
			}
			
			//// CHECK and EXTRACT DESIRE VALUES //////////////////////////////////////////////////////////////////////////////
			
			/* GUARD: Did Dark Sky return a parsedResult (stat != ok)? */
			guard let currently = parsedResult[Constants.JSONKeys.Currently] as? [String:AnyObject]  else {
				displayError("Dark Sky API returned an error. See error code and message in \(parsedResult)")
				return
			}
			
			
			/* 3. Send the desired value(s) to completion handler */
			
			// icon key
			if let error = error {
				print(error)
				completionHandlerForGetIconInfo(false, nil, "error")
				
			} else {
				if let icon = currently [Constants.JSONKeys.Icon] as? String {
					completionHandlerForGetIconInfo(true, icon, nil)
					
	
				} else {
					print("no se encontró el valor ´icon´")
					completionHandlerForGetIconInfo(false, nil, "error")
				}
			}
			
		}
		
		task.resume()
		
	}
	
	
	func getRainInfo(_ completionHandlerForGetRainInfo: @escaping ( _ success: Bool, _ rain: Double?, _  errorString: String?) -> Void) {
		
		
		// Step-1: Build the URL
		let request = NSMutableURLRequest(url: url())
		
		// Step-2: Make the request
		let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
			
			
			/// ERROR ///////////////////////////////////////////////////////////////////////////////////////////////////////
			// if an error occurs, print it
			func displayError(_ error: String) {
				print(error)
				
			}
			
			/// GUARD ///////////////////////////////////////////////////////////////////////////////////////////////////////
			/* GUARD: Was there an error? */
			guard (error == nil) else {
				displayError("There was an error with your request: \(error!)")
				return
			}
			
			/* GUARD: Did we get a successful 2XX response? */
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
				displayError("Your request returned a status code other than 2xx!")
				return
			}
			
			/* GUARD: Was there any data returned? */
			guard let data = data else {
				displayError("No data was returned by the request!")
				return
			}
			
			
			
			/// PARSE THE DATA ///////////////////////////////////////////////////////////////////////////////////////////////
			let parsedResult: [String:AnyObject]!
			do {
				parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
			} catch {
				displayError("Could not parse the data as JSON: '\(data)'")
				return
			}
			
			
			//// CHECK and EXTRACT DESIRE VALUES //////////////////////////////////////////////////////////////////////////////
			
			/* GUARD: Did Dark Sky return a parsedResult (stat != ok)? */
			guard let currently = parsedResult[Constants.JSONKeys.Currently] as? [String:AnyObject]  else {
				displayError("Dark Sky API returned an error. See error code and message in \(parsedResult)")
				return
			}
			
			
			/* 3. Send the desired value(s) to completion handler */
			
			// icon key
			if let error = error {
				print(error)
				completionHandlerForGetRainInfo(false, nil, "error")
				
			} else {
				if let rain = currently [Constants.JSONKeys.PrecipProbability] as? Double {
					completionHandlerForGetRainInfo(true, rain, nil)
					print("eeeee\(rain)")
					
				} else {
					print("no se encontró el valor ´icon´")
					completionHandlerForGetRainInfo(false, nil, "error")
				}
			}
			
		}
		
		task.resume()
		
	}

	
	func getTemperatureInfo(_ completionHandlerForTemperatureInfo: @escaping ( _ success: Bool, _ temperature: Double?, _  errorString: String?) -> Void) {
		
		
		// Step-1: Build the URL
		let request = NSMutableURLRequest(url: url())
		
		// Step-2: Make the request
		let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
			
			
			/// ERROR ///////////////////////////////////////////////////////////////////////////////////////////////////////
			// if an error occurs, print it
			func displayError(_ error: String) {
				print(error)
				
			}
			
			/// GUARD ///////////////////////////////////////////////////////////////////////////////////////////////////////
			/* GUARD: Was there an error? */
			guard (error == nil) else {
				displayError("There was an error with your request: \(error!)")
				return
			}
			
			/* GUARD: Did we get a successful 2XX response? */
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
				displayError("Your request returned a status code other than 2xx!")
				return
			}
			
			/* GUARD: Was there any data returned? */
			guard let data = data else {
				displayError("No data was returned by the request!")
				return
			}
			
			
			
			/// PARSE THE DATA ///////////////////////////////////////////////////////////////////////////////////////////////
			let parsedResult: [String:AnyObject]!
			do {
				parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
			} catch {
				displayError("Could not parse the data as JSON: '\(data)'")
				return
			}
			
			
			//// CHECK and EXTRACT DESIRE VALUES //////////////////////////////////////////////////////////////////////////////
			
			/* GUARD: Did Dark Sky return a parsedResult (stat != ok)? */
			guard let currently = parsedResult[Constants.JSONKeys.Currently] as? [String:AnyObject]  else {
				displayError("Dark Sky API returned an error. See error code and message in \(parsedResult)")
				return
			}
			
			
			/* 3. Send the desired value(s) to completion handler */
			
			// temperature key
			if let error = error {
				print(error)
				completionHandlerForTemperatureInfo(false, nil, "error")
				
			} else {
				if let temperature = currently [Constants.JSONKeys.Temperature] as? Double {
					completionHandlerForTemperatureInfo(true, temperature, nil)
					
				} else {
					print("no se encontró el valor ´icon´")
					completionHandlerForTemperatureInfo(false, nil, "error")
				}
			}
			
		}
		
		task.resume()
		
	}

	
	func getHumidityInfo(_ completionHandlerForHumidityInfo: @escaping ( _ success: Bool, _ humidity: Double?, _  errorString: String?) -> Void) {
		
		
		// Step-1: Build the URL
		let request = NSMutableURLRequest(url: url())
		
		// Step-2: Make the request
		let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
			
			
			/// ERROR ///////////////////////////////////////////////////////////////////////////////////////////////////////
			// if an error occurs, print it
			func displayError(_ error: String) {
				print(error)
				
			}
			
			/// GUARD ///////////////////////////////////////////////////////////////////////////////////////////////////////
			/* GUARD: Was there an error? */
			guard (error == nil) else {
				displayError("There was an error with your request: \(error!)")
				return
			}
			
			/* GUARD: Did we get a successful 2XX response? */
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
				displayError("Your request returned a status code other than 2xx!")
				return
			}
			
			/* GUARD: Was there any data returned? */
			guard let data = data else {
				displayError("No data was returned by the request!")
				return
			}
			
			
			
			/// PARSE THE DATA ///////////////////////////////////////////////////////////////////////////////////////////////
			let parsedResult: [String:AnyObject]!
			do {
				parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
			} catch {
				displayError("Could not parse the data as JSON: '\(data)'")
				return
			}
			
			
			//// CHECK and EXTRACT DESIRE VALUES //////////////////////////////////////////////////////////////////////////////
			
			/* GUARD: Did Dark Sky return a parsedResult (stat != ok)? */
			guard let currently = parsedResult[Constants.JSONKeys.Currently] as? [String:AnyObject]  else {
				displayError("Dark Sky API returned an error. See error code and message in \(parsedResult)")
				return
			}
			
			
			/* 3. Send the desired value(s) to completion handler */
			
			// humidity key
			if let error = error {
				print(error)
				completionHandlerForHumidityInfo(false, nil, "error")
				
			} else {
				if let humidity = currently [Constants.JSONKeys.Humidity] as? Double {
					completionHandlerForHumidityInfo(true, humidity, nil)
					
				} else {
					completionHandlerForHumidityInfo(false, nil, "error")
				}
			}
			
		}
		
		task.resume()
		
	}
	
	
	func getTimeZoneInfo(_ completionHandlerForGetTimeZoneInfo: @escaping ( _ success: Bool, _ timeZone: String?, _  errorString: String?) -> Void) {
		
		
		// Step-1: Build the URL
		let request = NSMutableURLRequest(url: url())
		
		// Step-2: Make the request
		let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
			
			
			/// ERROR ///////////////////////////////////////////////////////////////////////////////////////////////////////
			// if an error occurs, print it
			func displayError(_ error: String) {
				print(error)
				
			}
			
			/// GUARD ///////////////////////////////////////////////////////////////////////////////////////////////////////
			/* GUARD: Was there an error? */
			guard (error == nil) else {
				displayError("There was an error with your request: \(error!)")
				return
			}
			
			/* GUARD: Did we get a successful 2XX response? */
			guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
				displayError("Your request returned a status code other than 2xx!")
				return
			}
			
			/* GUARD: Was there any data returned? */
			guard let data = data else {
				displayError("No data was returned by the request!")
				return
			}
			
			
			
			/// PARSE THE DATA ///////////////////////////////////////////////////////////////////////////////////////////////
			let parsedResult: [String:AnyObject]!
			do {
				parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
			} catch {
				displayError("Could not parse the data as JSON: '\(data)'")
				return
			}
			
			
			//// CHECK and EXTRACT DESIRE VALUES //////////////////////////////////////////////////////////////////////////////
		
			
			/* 3. Send the desired value(s) to completion handler */
			
			// icon key
			if let error = error {
				print(error)
				completionHandlerForGetTimeZoneInfo(false, nil, "error")
				
			} else {
				if let timeZone = parsedResult [Constants.JSONKeys.TimeZone] as? String {
					completionHandlerForGetTimeZoneInfo(true, timeZone, nil)
					print("🎱\(timeZone)")
					
				} else {
					print("no se encontró el valor ´icon´")
					completionHandlerForGetTimeZoneInfo(false, nil, "error")
				}
			}
			
		}
		
		task.resume()
		
	}
	
	
	//*****************************************************************
	// MARK: - Shared Instance
	//*****************************************************************
	
	class func sharedInstance() -> DarkSky {
		
		struct Singleton {
			static var sharedInstance = DarkSky()
		}
		return Singleton.sharedInstance
	}
	
} // end class









