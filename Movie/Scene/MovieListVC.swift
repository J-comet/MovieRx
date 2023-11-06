//
//  MovieListVC.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import UIKit

class MovieListVC: UIViewController {

    let mainView = MovieListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.request(
            api: .searchMovieList(request: RequestBoxOffice(targetDt: "20120101")),
            type: ResponseDailyBoxOffice.self) { response in
                switch response {
                case .success(let success):
                    print(success.boxOfficeResult)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
    }


}

