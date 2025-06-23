//
//  WeightInputView.swift
//  EntrainementStateBindingEnvironement
//
//  Created by Thibault on 11/06/2025.
//

import SwiftUI

struct WeightInputView: View {
    
    @Environment(WeightViewModel.self) private var weightViewModel
    @Environment(PlanetViewModel.self) private var planetViewModel
    
    var body: some View {
        // Utilisation de @Bindable pour créer des bindings sur @Observable
        @Bindable var weightVM = weightViewModel
        
        VStack(spacing: 0) {
                VStack(spacing: 12) {
                    Text("Votre poids sur \(planetViewModel.planet.planetName)")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text(weightVM.formattedWeightOn(planet: planetViewModel.planet))
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .contentTransition(.numericText())
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.ultraThinMaterial)
                }
            
            Spacer()
            
            VStack(spacing: 16) {
                TextField("Poids sur \(planetViewModel.planet.planetName)", text: $weightVM.earthWeightText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .font(.title3)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.ultraThinMaterial)
                    }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.regularMaterial)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

#Preview {
    @Previewable @State var planetVM = PlanetViewModel()
    @Previewable @State var weightVM = WeightViewModel()
    
    WeightInputView()
        .environment(planetVM)
        .environment(weightVM)
        .background(Color.blue.opacity(0.8))
}
