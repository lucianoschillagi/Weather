//
//  AppDelegate.swift
//  Todo1_prueba_técnica
//
//  Created by Luciano Schillagi on 15/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	var window: UIWindow?
	
	/// User Location
	// gestionador de localización
	var locationMananger: CLLocationManager?
	
	// en principio no está la ubicación del usuario
	static var currentUserCoord = CLLocationCoordinate2D()
	
	// pone la coordenadas dentro de un string (para luego pasar como fragmento de la url que solicita el clima desde la ubicación del usuario
	static var coordString = String()
	
	
	//*****************************************************************
	// MARK: - App Methods
	//*****************************************************************
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		/// User Location
		locationMananger = CLLocationManager()
		
		// solicita permiso para usar servicios de ubicación mientras la aplicación está en primer plano
		locationMananger?.requestWhenInUseAuthorization()
		
		// extrae las coordenadas del usuario
		let userLocation = locationMananger?.location?.coordinate
		
		// y se las pasa a la propiedad 'ubicacionActualUsuario'
		AppDelegate.currentUserCoord = userLocation! // TODO: revisar esta línea
		
		// task: poner la coordenada dentro de un string
		let latitudeString = String(AppDelegate.currentUserCoord.latitude)
		let longitudeString = String(AppDelegate.currentUserCoord.longitude)
		let coordString = String(latitudeString + "," + longitudeString)
		
		AppDelegate.coordString = coordString

		
		return true
	}

} // end class

