//
//  DarkSkyConstants.swift
//  Todo1_prueba_técnica
//
//  Created by Luciano Schillagi on 16/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation

/*
Abstract:
Contiene los valores constantes a utilizarse en las solicitudes a la API de Sky Dark.
*/

// MARK: - Parse API Constants

extension DarkSky {
	
	struct Constants {
		
		//*****************************************************************
		// MARK: - Request
		//*****************************************************************
		
		static let ApiScheme = "https"
		static let ApiHost = "api.darksky.net"
		static let Forecast = "/forecast/"
		static let ApiKey = "0b16cb99b6c8c8405b69426666e40e14/" // my API key
		static let UserCoordinate = AppDelegate.coordString // // las coordenadas actuales del usuario

		//*****************************************************************
		// MARK: - Response
		//*****************************************************************
		
		// MARK: JSON Body Keys
		struct JSONKeys {
			
			static let Currently = "currently"
			
			// Weather Info
			static let Summary = "summary"
			static let Icon = "icon"
			static let PrecipProbability = "precipProbability"
			static let Humidity = "humidity"
			static let Temperature = "temperature"
			
			static let TimeZone = "timezone"

		}
	}
}





