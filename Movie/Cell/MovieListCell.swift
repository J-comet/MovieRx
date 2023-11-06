//
//  MovieListCell.swift
//  Movie
//
//  Created by 장혜성 on 2023/11/06.
//

import UIKit

import SnapKit

final class MovieListCell: UICollectionViewCell {
    
    static let identifier = "MovieListCell"
    
    let nameLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
