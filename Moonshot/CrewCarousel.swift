//
//  CrewCarousel.swift
//  Moonshot
//
//  Created by David Ash on 16/07/2023.
//

import SwiftUI

struct CrewCarousel: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                    } label: {
                        HStack {
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crew.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crew.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewCarousel_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewCarousel(crew: [
            CrewMember(role: "Commander", astronaut: astronauts["borman"]!),
            CrewMember(role: "Command Module Pilot", astronaut: astronauts["lovell"]!),
            CrewMember(role: "Lunar Module Pilot", astronaut: astronauts["aldrin"]!)
        ])
            .preferredColorScheme(.dark)
    }
}
