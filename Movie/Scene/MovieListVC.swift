//
//  MovieListVC.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import UIKit

class MovieListVC: UIViewController {

    private let mainView = MovieListView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        
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

    private func configureVC() {
        navigationItem.title = "일일 목록"
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }

}

extension MovieListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.identifier, for: indexPath) as? MovieListCell else {
            return UICollectionViewCell()
        }
        cell.nameLabel.text = "1234"
        return cell
    }
}

