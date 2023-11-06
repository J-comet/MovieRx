//
//  SearchMovieRepository.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import Foundation

final class SearchMovieRepository {
    
    // testTargetDt = 20120101
    func fetchMovieList(
        targetDt: String,
        completion: @escaping (Result<ResponseDailyBoxOffice, Error>) -> Void
    ) {
        APIManager.shared.request(
            api: .searchMovieList(request: RequestBoxOffice(targetDt: targetDt)),
            type: ResponseDailyBoxOffice.self) { response in
                completion(response)
//                switch response {
//                case .success(let success):
//                    print(success.boxOfficeResult)
//                    let list = success.boxOfficeResult.dailyBoxOfficeList
//                    self.viewModel.items.accept(list)
//                case .failure(let failure):
//                    print(failure.localizedDescription)
//                }
            }
        
    }
    
}
