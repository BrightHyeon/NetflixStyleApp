//
//  ContentCollectionViewRankCell.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/08.
//

import UIKit

class ContentCollectionViewRankCell: UICollectionViewCell {
    let imageView = UIImageView()
    let rankLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //컬렉션뷰셀이 가지는 기본 뷰인 contentView부터 설정.
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        //imageView
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView)
        
        //imageView의 오토레이아웃 설정.
        imageView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8) //가로는 슈퍼뷰보다 0.8정도 작게.
        }
        
        //rankLabel
        rankLabel.font = .systemFont(ofSize: 100, weight: .black)
        rankLabel.textColor = .white
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(25)
        }
        
    }
    
}
