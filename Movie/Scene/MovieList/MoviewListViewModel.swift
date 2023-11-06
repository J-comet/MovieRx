//
//  MoviewListViewModel.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import Foundation

import RxSwift
import RxCocoa

final class MoviewListViewModel {
    
    enum MovieListViewState {
//        case initValue
        case loading
        case success
        case fail
    }
    
    private let searchMovieRepository = SearchMovieRepository()
    
    let disposeBag = DisposeBag()

    let state = ReplayRelay<MovieListViewState>.create(bufferSize: 2)
    
    let items: BehaviorRelay<[DailyBoxOfficeList]> = BehaviorRelay(value: [])
    
    func searchMovie(targetDt: String) {
        state.accept(.loading)
        searchMovieRepository.fetchMovieList(
            targetDt: targetDt) { [weak self] response in
                switch response {
                case .success(let success):
                    let list = success.boxOfficeResult.dailyBoxOfficeList
                    self?.state.accept(.success)
                    self?.items.accept(list)
                case .failure(let failure):
                    print(failure.localizedDescription)
                    self?.state.accept(.fail)
                }
            }
    }
}

