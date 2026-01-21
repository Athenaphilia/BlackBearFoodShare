//
//  BuildingAddressItem.swift
//  BlackBearFoodShare
//
//  Created by Corey Kaulenas on 12/7/25.
//

import Foundation
import MapKit

class BuildingLocator {
    static let shared = BuildingLocator()
    
    // Map of aliases to the full address
    private let buildingAddresses: [String: String] = [
        "Ferland Hall": "75 Long Rd. University of Maine Orono, Maine 04469",
        "Neville Hall": "98 Beddington Rd, Orono, ME 04473 United States",
        "DPC Hall": "29 Beddington Rd, Orono, ME 04469"
    ]
    
    public init() {}

    // Returns the address string for the alias
    public func address(for alias: String) -> String? {
        buildingAddresses[alias]
    }
    
    public func allAliases() -> [String] {
        buildingAddresses.keys.sorted()
    }
    
    // Returns a URL that can be opened directly in Apple Maps or Safari
    func mapsURL(for alias: String) -> URL? {
        guard let address = address(for: alias) else { return nil }
        
        let encoded = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return URL(string: "https://maps.apple.com/?q=\(encoded)")
    }
    
    // Returns something that can be opened in apple maps
    func mapItem(for alias: String, completion: @escaping (MKMapItem?) -> Void) {
        guard let address = address(for: alias) else {
            completion(nil)
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = address
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let item = response?.mapItems.first else {
                completion(nil)
                return
            }
            completion(item)
        }
    }
}
