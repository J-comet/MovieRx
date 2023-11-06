//
//  MovieListVC.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import UIKit

import RxSwift
import RxCocoa

class MovieListVC: UIViewController {

    private let mainView = MovieListView()
    private let viewModel = MoviewListViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        bind()
    }
    
    private func bind() {
        viewModel.searchMovie(targetDt: "20201001")
        viewModel.state.subscribe(with: self) { owner, state in
            switch state {
            case .loading: owner.mainView.showLoadingView()
            case .success: owner.mainView.hideLoadingView()
            case .fail: owner.mainView.hideLoadingView()
            }
        }
        .disposed(by: viewModel.disposeBag)
        
        viewModel.items
            .bind(to: mainView.collectionView.rx.items(cellIdentifier: MovieListCell.identifier, cellType: MovieListCell.self)) { (row, element, cell) in
                cell.configCell(row: element)
            }
            .disposed(by: viewModel.disposeBag)
    }

    private func configureVC() {
        navigationItem.title = "일일 목록"
    }

}

