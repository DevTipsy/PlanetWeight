//
//  PlanetViewModel.swift
//  EntrainementStateBindingEnvironement
//
//  Created by Thibault on 11/06/2025.
//

import Foundation

@Observable
class PlanetViewModel {
    
    var planet: PlanetsEnum = .earth
    
    func changePlanet(_ planet: PlanetsEnum) {
        self.planet = planet
    }
}
