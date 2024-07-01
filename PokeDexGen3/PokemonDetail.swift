//
//  PokemonDetail.swift
//  PokeDexGen3
//
//  Created by Morgyn Peay on 7/1/24.
//

import SwiftUI
import CoreData

struct PokemonDetail: View {
    @EnvironmentObject var pokemon: Pokemon
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonDetail()
        .environmentObject(SamplePokemon.samplePokemon)
}
