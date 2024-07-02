//
//  ContentView.swift
//  PokeDexGen3
//
//  Created by Morgyn Peay on 6/26/24.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        animation: .default
    ) private var pokedex: FetchedResults<Pokemon>
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
//        predicate: NSPredicate(format: "favorite = %d", true),
//        animation: .default
//    ) private var favorites: FetchedResults<Pokemon>
    
    @State var filterByFavorites = false
    @StateObject private var pokemonVM = ViewModel(controller: FetchCotroller())

    var body: some View {
        switch pokemonVM.status {
        case .success:
            NavigationStack {
                List(pokedex) { pokemon in
                    NavigationLink(value: pokemon) {
                        AsyncImage(url: pokemon.sprite) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        
                        Text(pokemon.name!.capitalized)
                    }
                    
                }
                .navigationTitle("Pokedex")
                .navigationDestination(for: Pokemon.self, destination: { pokemon in
                    PokemonDetailView()
                        .environmentObject(pokemon)
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            filterByFavorites.toggle()
                        } label: {
                            Label("Filter By Favorites", systemImage: filterByFavorites ? "star.fill" : "star")
                        }
                    }
                }
            }
            
        default:
            ProgressView()
            Text("Pokemon loading...")
                .padding(.top, 10)
                .foregroundStyle(Color(.gray))
            
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
