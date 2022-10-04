//
//  NetworkRequester.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 04/10/2022.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case unexpectedStatusCode(code: Int)
    case unknown(error: Error)
    case noData
}

class NetworkRequester {
    func performRequest(on url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let error {
                completionHandler(.failure(NetworkError.unknown(error: error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(NetworkError.badResponse))
                return
            }

            if !(200...299).contains(httpResponse.statusCode) {
                completionHandler(.failure(NetworkError.unexpectedStatusCode(code: httpResponse.statusCode)))
                return
            }

            if let data {
                completionHandler(.success(data))
            } else {
                completionHandler(.failure(NetworkError.noData))
            }
        })
        task.resume()
    }
}
