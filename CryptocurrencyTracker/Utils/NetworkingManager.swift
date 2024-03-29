//
//  NetworkingManager.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 17.12.2021.
//

import Foundation
import Combine

final class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badULResponce(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badULResponce(url: let url): return "[🔥] Bad responce from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponce(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponce(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let responce = output.response as? HTTPURLResponse,
              responce.statusCode >= 200 && responce.statusCode < 300
        else {
            throw NetworkingError.badULResponce(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

