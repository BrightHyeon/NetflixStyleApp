//
//  ContentView.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/12.
//

import SwiftUI

struct ContentView: View {
    
    let titles = ["Netflix Sample App"]
    
    var body: some View {
        //MARK: - Navigation Bar를 가지는 List 만들기
        //1. 네비게이션 클로저
        NavigationView {
            
            //2. 리스트 클로저 (UIKit의 TableView와 유사) + 부연설명 ▼
            List(titles, id: \.self) { // What is the \.self ?
                let netflixVC = HomeViewControllerRepresentable()
                    .navigationBarHidden(true) //NavigationBar가 뜨지않도록.
                    .edgesIgnoringSafeArea(.all)
                NavigationLink($0, destination: netflixVC) //연결 생성.
            }
            .navigationTitle("SwiftUI to UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 2. List를 initialize하기 위해선 어떠한 data 혹은 rawValue가 들어갈지를 Array(배열)형태로 넣어줘야함.
    위에선 title이라는 배열을 만들어서 넣어준 것.
    "Netflix Sample App"이란 title을 가지는 List를 생성.
    그리고 List의 클로저((Data.Element) -> View)안에서 구체적으로 어떤 내용을 표현할 것인지를 설정.
 
 */
