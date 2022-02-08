//
//  Content.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/07.
//

import UIKit

//읽기작업만 할 것이나 Decodable하게. (Codable해도 상관없음)
struct Content: Decodable {
    let sectionType: SectionType
    let sectionName: String
    let contentItem: [Item]
    
    enum SectionType: String, Decodable {
        case main
        case basic
        case rank
        case large
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage()
    }
}
