//
//  UniversityModel.swift
//  UniversityList
//
//  Created by Juan Camilo Marín Ochoa on 11/09/22.
//

import Foundation

// MARK: - UniversityResponse
struct UniversityResponse: Decodable {
    let domains, web_pages: [String]
    let alpha_two_code, country, name: String
}
