//
//  HomeViewController.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/07.
//

import UIKit
import SwiftUI

class HomeViewController: UICollectionViewController {
    
    var contents: [Content] = []
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        //기본 배경색
        collectionView.backgroundColor = .black
        
        //네비게이션바 CUSTOM하게 설정.
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //빈 UIImage를 default상태로.
        navigationController?.navigationBar.shadowImage = UIImage() //약간 그림자 주기.
        navigationController?.hidesBarsOnSwipe = true //스크롤 중에는 사라지도록.
        
        //바버튼아이템 설정.
//        #imageLiteral(resourceName: "netflix_icon") <- xcode13부턴 이런식으로 해야할 듯.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "netflix_icon"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        
        //Data 설정, 가져와서 할당하기.
        contents = getContents()
        
        //CollectionView Item(Cell) 설정 (등록) - 이렇게 컬렉션뷰에 등록해놔야 DataSource의 cellForItemAt에서도 dequeue정의가능.
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        //비슷하게 Header등록. register()메서드 다름 주의.
        collectionView.register(ContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentCollectionViewHeader")
        
        //컬렉션뷰의 레이아웃은 이 layout()메서드를 통해 설정해줘라. SceneDelegate에서 넣었던 FlowLayout객체를 이제 꾸민 것.
        collectionView.collectionViewLayout = layout()
    }
    
    //contents배열이 Content.plist의 데이터를 실제로 가져올 수 있도록.
    func getContents() -> [Content] {
        //어떤 data를 가져올거야? -> "Content.plist"라는 경로에 있는 data를 가져올거야!
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"), //경로지정
              let data = FileManager.default.contents(atPath: path), //지정된 경로의 데이터
              //data를 원하는 형태로 decode하기.
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else { return [] }
        return list
    }
    
    //각각의 섹션 타입에 대한 UICollectionViewLayout 생성.
    private func layout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout {[weak self] sectionNumber,
            environment -> NSCollectionLayoutSection? in
            
            guard let self = self else { return nil }
            
            switch self.contents[sectionNumber].sectionType {
            case .basic:
                return self.createBasicTypeSection()
            default:
                return nil
            }
            
        }
    }
    
    //Basic Section 형태 구성.
    private func createBasicTypeSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.75))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 10, leading: 5, bottom: 0, trailing: 5)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let sectionHeader = self.createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    //SectionHeader layout설정
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        //Section Header 사이즈
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
        
        //Section Header Layout
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return sectionHeader
    }
}

//UICollectionView DataSource, Delegate
extension HomeViewController {
    //섹션당 보여질 셀의 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if contents[section].sectionType == .basic {
            switch section {
            case 0:
                return 1
            default:
                return contents[section].contentItem.count
            }
        }
        return 0
    }
    
    //콜렉션뷰 셀 설정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch contents[indexPath.section].sectionType {
        case .basic, .large:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    //헤더뷰 설정 (각종 SupplementaryView들을 설정하는 메서드.)
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContentCollectionViewHeader", for: indexPath) as? ContentCollectionViewHeader else { fatalError("Could not dequeue Header") }
            
            headerView.sectionNameLabel.text = contents[indexPath.section].sectionName
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    //섹션 갯수 설정 - (섹션 여러개 쓸 것이니.)
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    //셀 선택 - Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("TEST: \(sectionName)섹션의 \(indexPath.row + 1)번째 콘텐츠") //index값은 0부터 시작하니 +1
    }
}

//SwiftUI를 활용한 미리보기

struct HomeViewController_Previews: PreviewProvider {

    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let layout = UICollectionViewFlowLayout()
            let homeViewController = HomeViewController(collectionViewLayout: layout)
            return UINavigationController(rootViewController: homeViewController)
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        typealias UIViewContollerType = UIViewController
    }
}
