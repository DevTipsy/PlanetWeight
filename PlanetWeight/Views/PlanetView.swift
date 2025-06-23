//
//  PlanetView.swift
//  EntrainementStateBindingEnvironement
//
//  Created by Thibault on 11/06/2025.
//

import SwiftUI

struct PlanetView: View {
    
    @State private var planetVM = PlanetViewModel()
    @State private var weightVM = WeightViewModel()
    
    var body: some View {
        ZStack {
            // Changement de la couleur en fonction de la planète
            planetVM.planet.backgroundColor
                .ignoresSafeArea()
            
            // Changement de planète
            VStack(spacing: 0) {
                PlanetChangeView()
                    .environment(planetVM)
            }
            
            // Affichage du poids en fonction de la planète
            VStack {
                Spacer()
                WeightInputView()
                    .environment(planetVM)
                    .environment(weightVM)
            }
        }
    }
}

#Preview {
    PlanetView()
}
