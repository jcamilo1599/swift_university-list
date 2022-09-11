//
//  NetworkUniversities.swift
//  UniversityList
//
//  Created by Juan Camilo Marín Ochoa on 11/09/22.
//

import Foundation
import Alamofire

final class NetworkUniversities: ObservableObject {
    private var url: String? = "http://universities.hipolabs.com/search?country=Colombia"
    
    static let shared = NetworkUniversities()
    
    func getUniversities(
        success: @escaping (_ universities: [UniversityResponse]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        if (url != nil) {
            AF
                .request(url!, method: .get)
                .validate(statusCode: 200...299)
                .responseDecodable(of: [UniversityResponse].self) {
                    response in
                    
                    if let universities = response.value {
                        success(universities)
                    } else {
                        print(response.error!)
                        failure(response.error)
                    }
                }
        }
    }
}
