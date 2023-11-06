//
//  Router.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import Foundation

import Alamofire

enum Router: URLRequestConvertible {
    
    case searchMovieList(request: RequestBoxOffice)
    
    private var baseURL: URL {
        switch self {
        case .searchMovieList:
            return URL(string: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/")!
        }
    }
    
    private var path: String {
        switch self {
        case .searchMovieList:
            return "searchDailyBoxOfficeList.json"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    private var query: [String: String] {
        switch self {
        case .searchMovieList(let request):
            return request.toEncodable
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        return request
    }
    
}

