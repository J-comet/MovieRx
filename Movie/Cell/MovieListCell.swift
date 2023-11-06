//
//  MovieListCell.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class MovieListCell: UICollectionViewCell {
    
    static let identifier = "MovieListCell"
    
    let nameLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configCell(row: DailyBoxOfficeList) {
        nameLabel.text = row.movieNm
    }
    
    private func configure() {
        contentView.addSubview(nameLabel)
    }
    
    private func setLayout() {
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
    }
}
