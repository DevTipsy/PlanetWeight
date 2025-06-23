//
//  PlanetChangeView.swift
//  EntrainementStateBindingEnvironement
//
//  Created by Thibault on 11/06/2025.
//

import SwiftUI

struct PlanetChangeView: View {
    
    @Environment(PlanetViewModel.self) var planetModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(PlanetsEnum.allCases, id: \.self) { planet in
                            VStack(spacing: 20) {
                                planet.displayPlanet()
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300, height: 300)
                                
                                Text(planet.planetName)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 1)
                            }
                            .frame(width: geometry.size.width)
                            .id(planet)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .onScrollGeometryChange(for: Int.self) { geometry in
                    guard geometry.contentSize.width > 0 else { return 0 }
                    
                    let pageWidth = geometry.containerSize.width
                    let currentIndex = Int(round(geometry.contentOffset.x / pageWidth))
                    
                    return max(0, min(currentIndex, PlanetsEnum.allCases.count - 1))
                } action: { oldIndex, newIndex in
                    guard oldIndex != newIndex,
                          newIndex >= 0,
                          newIndex < PlanetsEnum.allCases.count else { return }
                    
                    let currentPlanet = PlanetsEnum.allCases[newIndex]
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        planetModel.changePlanet(currentPlanet)
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var test = PlanetViewModel()
    PlanetChangeView()
        .environment(test)
        .background(Color.blue.opacity(0.8))
}
