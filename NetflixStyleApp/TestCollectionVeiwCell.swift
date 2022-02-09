//
//  TestCollectionVeiwCell.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/09.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    var testButton = UIButton.Configuration.plain()
    
    let plain = UIButton(configuration: .plain(), primaryAction: nil)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        testButton.title = "Title"
        testButton.image = UIImage(systemName: "swift")
        testButton.titlePadding = 10
        testButton.imagePadding = 10
        testButton.imagePlacement = .top
        testButton.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        
        plain.configuration?.imagePlacement = .top
        
    }
    
    
}
