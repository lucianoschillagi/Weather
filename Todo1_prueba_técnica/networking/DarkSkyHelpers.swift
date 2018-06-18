//
//  DarkSkyHelpers.swift
//  Todo1_prueba_técnica
//
//  Created by Luciano Schillagi on 16/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import Foundation


/**
Configura la URL a enviar en las solicitudes web a la API de Parse.

- parameter path: toma el 'path' de la solicitud.
- parameter fromParameters: toma los parámetros (si es que los tiene) de la solicitud.

- returns: devuelve la URL ya configurada.

*/

/**
Configura la URL a enviar en las solicitudes web a la API de Parse.
*/

extension DarkSky {

	func url() -> URL {
		
		var components = URLComponents()
		components.scheme = Constants.ApiScheme
		components.host = Constants.ApiHost
		components.path = Constants.Forecast + Constants.ApiKey + Constants.UserCoordinate
		
		return components.url!
	}

}
