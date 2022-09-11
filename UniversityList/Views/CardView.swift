//
//  CardView.swift
//  UniversityList
//
//  Created by Juan Camilo Marín Ochoa on 16/09/22.
//

import SwiftUI

struct CardView: View {
    var university: UniversityResponse
    
    private let maxWidth: Double = 400
    private let background: Color = Color.cyan
    
    var body: some View {
        Section(
            header:
                VStack {
                    Spacer().frame(height: 12)
                    Text(university.name)
                        .font(.title.weight(Font.Weight.bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Spacer().frame(height: 12)
                }
                .frame(maxWidth: maxWidth)
                .background(background)
                .cornerRadius(10)
        ) {
            VStack {
                Spacer().frame(height: 16)
                Text("País: \(university.country)")
                Text("Código del país: \(university.alpha_two_code)")
                Text("Página web: \(university.web_pages[0])")
                Spacer().frame(height: 12)
            }
            .foregroundColor(.white)
            .frame(maxWidth: maxWidth)
            .background(background)
            .cornerRadius(10)
            .padding(.top, -16)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(university: UniversityResponse(
            domains: [],
            web_pages: [],
            alpha_two_code: "CO",
            country: "Colombia",
            name: "Grancolombiano"
        ))
    }
}
