//
//  ContentDetailView.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/12.
//

import SwiftUI

struct ContentDetailView: View {
    
    @State var item: Item? //시뮬레이터에선 @State없어도 되긴함.
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                if let item = item {
                    Image(uiImage: item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit) //contentMode설정
                        .frame(width: 200, height: 300)
                    
        
                    Text(item.description)
                        .font(.title3) //font
                        .fontWeight(.semibold) //두께
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center) //텍스트정렬(왼쪽, 가운데, 오른쪽 등등)
                        .padding() //좌우나 위아래로 약간의 간격을 두게하는 메서드
                } else {
                    Color.white //item이 없을경우에는 그냥 흰색바탕만 보여줘.
                }
            }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item0 = Item(description: "흥미진진, 판타지, 애니메이션, 액션, 멀티캐스팅", imageName: "poster0") //임의아이템생성
        ContentDetailView(item: item0)
    }
}

/*
 PropertyWrapper : 이 View에 어떤 외부자극없이 내부의 어떤 상태가 어떻게 변화될 것인지를 표시하는 것.
 ex) @State - 공부 더 필요
 */
