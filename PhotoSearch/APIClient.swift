//
//  APIClient.swift
//  PhotoSearch
//
//  Created by Cristian Sancricca on 08/07/2022.
//

import Foundation
import Combine

class APIClient {
    
    public func searchPhotos(for query: String) -> AnyPublisher<[Photo], Error> {
        
        let perPage = 200
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "boca"
        let endpoint = "https://pixabay.com/api/?key=\(Config.apikey)&q=\(query)&per_page=\(perPage)&safesearch=true"
        
        let url = URL(string: endpoint)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PhotoModel.self, decoder: JSONDecoder())
            .map { $0.hits}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}
