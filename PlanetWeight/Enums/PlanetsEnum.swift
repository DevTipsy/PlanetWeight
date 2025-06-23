//
//  PlanetsEnum.swift
//  EntrainementStateBindingEnvironement
//
//  Created by Thibault on 11/06/2025.
//

import SwiftUI
import Foundation

enum PlanetsEnum: CaseIterable {
    case earth, mars, jupiter, saturn, uranus, neptune, venus, mercury
    
    // Nom de l'asset = nom affiché
    private var assetName: String {
        switch self {
        case .earth: return "Terre"
        case .mars: return "Mars"
        case .jupiter: return "Jupiter"
        case .saturn: return "Saturn"
        case .uranus: return "Uranus"
        case .neptune: return "Neptune"
        case .venus: return "Venus"
        case .mercury: return "Mercure"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .earth: return Color.blue.opacity(0.8)
        case .mars: return Color.red.opacity(0.7)
        case .jupiter: return Color.brown.opacity(0.8)
        case .saturn: return Color.green.opacity(0.6)
        case .uranus: return Color.purple.opacity(0.7)
        case .neptune: return Color.mint.opacity(0.8)
        case .venus: return Color.orange.opacity(0.7)
        case .mercury: return Color.purple.opacity(0.7)
        }
    }
    
    var gravityMultiplier: Double {
        switch self {
        case .mercury: return 0.38
        case .venus: return 0.91
        case .earth: return 1.00
        case .mars: return 0.38
        case .jupiter: return 2.54
        case .saturn: return 1.08
        case .uranus: return 0.91
        case .neptune: return 1.19
        }
    }
    
    // L'image est appelée par le nom de l'image
    func displayPlanet() -> Image {
        return Image(assetName)
    }
    
    var planetName: String {
        return assetName
    }
}
