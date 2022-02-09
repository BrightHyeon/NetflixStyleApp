//
//  ContentCollectionViewMainCell.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/08.
//

import UIKit

class ContentCollectionViewMainCell: UICollectionViewCell {
    //StackViews
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    //baseStackViewComponents
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let contentStackView = UIStackView()
    //contentStackViewComponents
    let plusButton = UIButton()
    let playButton = UIButton()
    let infoButton = UIButton()
    
    //menuStackViewComponents
    let tvButton = UIButton()
    let movieButton = UIButton()
    let categoryButton = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [baseStackView, menuStackView].forEach {
            contentView.addSubview($0)
        }
        
        //baseStackView 속성 선언
        baseStackView.axis = .vertical //축이 세로방향. 세로방향으로 요소 추가됨.
        baseStackView.alignment = .center //중앙정렬
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        baseStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        //baseStackView 컴포넌트 설정
        [imageView, descriptionLabel, contentStackView].forEach {
            baseStackView.addArrangedSubview($0)
        }
        
        //imageView
        imageView.contentMode = .scaleAspectFill //비율에 맞게.
        imageView.snp.makeConstraints {
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        //descriptionLabel
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.sizeToFit()
        
        //contentStackView
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .equalCentering
        contentStackView.spacing = 20
        
        contentStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        [plusButton, infoButton].forEach {
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .white
        }
        
        plusButton.setTitle("내가 찜한 콘텐츠", for: .normal)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(tapPlusButton), for: .touchUpInside)
        
        infoButton.setTitle("정보", for: .normal)
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.addTarget(self, action: #selector(tapInfoButton), for: .touchUpInside)
        
        playButton.setTitle("► 재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 3
        
        playButton.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
        playButton.addTarget(self, action: #selector(tapPlayButton), for: .touchUpInside)
        
        //menuStackView 속성 선언
        menuStackView.axis = .horizontal //축이 가로방향. 가로방향으로 요소 추가됨.
        menuStackView.alignment = .center
        menuStackView.distribution = .equalSpacing
        menuStackView.spacing = 20
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(baseStackView) // = .equalToSuperView()
            $0.leading.trailing.equalToSuperview().inset(30) //inset은 안쪽으로, offset은 바깥쪽으로.
        }
        
        //menuStackView 컴포넌트 설정 (속성을 먼저 깐 후, addArrangedSubview()해주기.)
        [tvButton, movieButton, categoryButton].forEach {
            menuStackView.addArrangedSubview($0)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.shadowColor = UIColor.black.cgColor //그림자 부여
            $0.layer.shadowOpacity = 1 //불투명도
            $0.layer.shadowRadius = 3
        }
        
        tvButton.setTitle("TV 프로그램", for: .normal)
        movieButton.setTitle("영화", for: .normal)
        categoryButton.setTitle("카테고리 ▼", for: .normal)
        
        //액션정의. 스토리보드에선 IBAction이었지만, 코드베이스로는 Selector이용.
        tvButton.addTarget(self, action: #selector(tapTvButton), for: .touchUpInside)
        movieButton.addTarget(self, action: #selector(tapMovieButton), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(tapCategoryButton), for: .touchUpInside)
    }
    
    @objc func tapTvButton(sender: UIButton!) {
        print("TEST: TV Button Tapped")
    }
    @objc func tapMovieButton(sender: UIButton!) {
        print("TEST: Movie Button Tapped")
    }
    @objc func tapCategoryButton(sender: UIButton!) {
        print("TEST: Category Button Tapped")
    }
    @objc func tapPlusButton(sender: UIButton!) {
        print("TEST: Plus Button Tapped")
    }
    @objc func tapInfoButton(sender: UIButton!) {
        print("TEST: Info Button Tapped")
    }
    @objc func tapPlayButton(sender: UIButton!) {
        print("TEST: Play Button Tapped")
    }
}
