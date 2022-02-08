//
//  ContentCollectionViewHeader.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/08.
//

import UIKit
//섹션의 Header 구성.
//반드시 UICollectionReusableView형태여야 Header나 Footer를 쓸 수 있음.
class ContentCollectionViewHeader: UICollectionReusableView {
    
    let sectionNameLabel = UILabel()
    
    //Cell과 동일하게 layoutSubviews() 메서드 안에서 정의.
    override func layoutSubviews() {
        super.layoutSubviews()
        //Label 구성
        sectionNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        sectionNameLabel.textColor = .white
        sectionNameLabel.sizeToFit()
        //View에 Label추가
        addSubview(sectionNameLabel) // = self.addSubview(sectionNameLabel) - 여기서 self Resuable한 이 헤더를 말함.
        //View에서의 Label의 제약조건 설정
        sectionNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview() //y축 기준 슈퍼뷰의 가운데.
            $0.top.bottom.leading.equalToSuperview().offset(10) //위,아래,왼쪽으로부터 10만큼 떨어진 곳으로 위치.
        }
    }
}
