//
//  ContentCollectionViewCell.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/08.
//

import UIKit
import SnapKit

//셀 그리기(?)
class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView() //셀은 하나의 이미지만을 가질 것이니. 미리 선언.
    
    //이 메서드 안에서 detail한 Layout을 설정해줄 것.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //컨텐트뷰라는 기본객체가 존재(슈퍼뷰). 이를 설정 후 이 위에 서브뷰들을 올릴 것.
        //컨텐트뷰 설정
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true //SubView가 ContentView의 Bounds(범위)를 넘어갈 시 clip(잘라냄)함.
        
        //들어갈 이미지뷰(서브뷰) 설정
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView) //스토리보드상에서 라벨이나 뷰 등을 끌어오는 것과 같음.
        
        //imageView의 오토레이아웃을 설정.(제약조건 걸기) ***
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview() //슈퍼뷰 즉, 여기선 contentView의 사이즈에 딱 맞도록. edges = 각 모서리.
        }
    }
}
