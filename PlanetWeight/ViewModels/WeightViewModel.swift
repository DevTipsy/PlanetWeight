//
//  WeightViewModel.swift
//  EntrainementStateBindingEnvironement
//
//  Created by Thibault on 11/06/2025.
//

import Foundation

@Observable
class WeightViewModel {
    
    var earthWeightText: String = ""
    var earthWeight: Double { Double(earthWeightText) ?? 0 }
    
    // Propriété calculée qui s'adapte automatiquement à la planète sur la vue
    func weightOn(planet: PlanetsEnum) -> Double {
        return earthWeight * planet.gravityMultiplier
    }
    
    // Version formatée pour l'affichage
    func formattedWeightOn(planet: PlanetsEnum) -> String {
        let weight = weightOn(planet: planet)
        return String(format: "%.1f kg", weight)
    }
}
