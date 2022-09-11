//
//  UniversitiesView.swift
//  UniversityList
//
//  Created by Juan Camilo Marín Ochoa on 16/09/22.
//

import SwiftUI

struct UniversitiesView: View {
    @State private var universities: [UniversityResponse] = []
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVStack(alignment: .center, pinnedViews: [.sectionHeaders]) {
                        Spacer().frame(height: 20)
                        
                        ForEach(universities.indices, id: \.self) { universityIndex in
                            let university: UniversityResponse = universities[universityIndex]
                            
                            CardView(university: university)
                                .padding(.horizontal)
                            
                            Spacer().frame(height: 20)
                        }
                    }
                }
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                .navigationTitle("Universidades")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: getData)
    }
    
    private func getData() {
        NetworkUniversities.shared.getUniversities { response in
            universities.append(contentsOf: response)
        } failure: { error in
            print(error ?? "")
        }
    }
}

struct UniversitiesView_Previews: PreviewProvider {
    static var previews: some View {
        UniversitiesView()
    }
}
