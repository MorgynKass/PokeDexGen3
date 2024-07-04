//
//  WidgetPokemon.swift
//  PokeDexGen3
//
//  Created by Morgyn Peay on 7/2/24.
//

import SwiftUI

enum WidgetSize {
    case small, medium, large
}

struct WidgetPokemon: View {
    @EnvironmentObject var pokemon: Pokemon
    
    let widgetSize: WidgetSize
    
    var body: some View {
        ZStack {
//            Color(pokemon.types![0].capitalized)
            
            switch widgetSize {
            case .small:
                FetchedImage(url: pokemon.sprite)
                
            case .medium:
                HStack {
                    FetchedImage(url: pokemon.sprite)
                        .frame(width: 200)
                        .padding(.trailing, -50)
                    
                    VStack(alignment: .leading) {
                        Text(pokemon.name!.capitalized)
                            .frame(width: 100)
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(Color(pokemon.types![0].capitalized))
                            .cornerRadius(20)
                        
                        Text(pokemon.types!.joined(separator: ", ").capitalized)
                            .frame(width: 120)
                            .font(.subheadline)
                            
                        
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .padding(40)
                }
                
            case .large:
                FetchedImage(url: pokemon.sprite)
                
                VStack {
                    HStack {
                        Text(pokemon.name!.capitalized)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(Color(pokemon.types![0].capitalized))
                            .cornerRadius(20)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text(pokemon.types!.joined(separator: ", ").capitalized)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(Color(pokemon.types![0].capitalized))
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WidgetPokemon(widgetSize: .medium)
        .environmentObject(SamplePokemon.samplePokemon)
}
