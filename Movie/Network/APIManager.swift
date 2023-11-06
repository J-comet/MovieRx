//
//  APIManager.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import Foundation

import Alamofire

final class APIManager {
    static let shared = APIManager()
    private init() { }
    
    func request<T: Decodable>(
        api: Router,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(
            api
        ).responseDecodable(of: T.self) { response in
            var result = ""
            switch response.result {
            case .success(let data):
                result = "성공"
                completion(.success(data))
            case .failure(let error):
                result = "실패"
                completion(.failure(error))
            }
            print("========= \(response.request?.url) - \(result) =========")
        }
    }

}
