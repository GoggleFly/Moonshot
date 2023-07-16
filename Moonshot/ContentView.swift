//
//  ContentView.swift
//  Moonshot
//
//  Created by David Ash on 15/07/2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var gridDisplayMode = false
    
    var body: some View {
        NavigationView {
            Group {
                if gridDisplayMode {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label: {
                                    VStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding([.vertical], 10)
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .foregroundColor(.white.opacity(0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(.lightBackground)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    )
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                } else {
                    List(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding([.vertical], 5)
                                    .padding([.trailing], 10)
                                
                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                            }
                        }
                        .listRowBackground(Color.darkBackground)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    gridDisplayMode.toggle()
                } label: {
                    Image(systemName: gridDisplayMode ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
