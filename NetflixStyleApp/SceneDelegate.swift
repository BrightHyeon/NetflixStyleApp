//
//  SceneDelegate.swift
//  NetflixStyleApp
//
//  Created by HyeonSoo Kim on 2022/02/07.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //MARK: - SwiftUI 버전!!!
        //새로만든 ContentView가 루트뷰가 되도록 설정.
        let contentView = ContentView() //SwiftUI View file
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            self.window?.makeKeyAndVisible()
        }
        
        
        /*
        //MARK: - <initial뷰컨트롤러 설정> //기존 버전!!!UIKit!!!
        //windowScene선언.
        guard let windowScene = scene as? UIWindowScene else { return }
        //window프로퍼티 선언.
        self.window = UIWindow(windowScene: windowScene)
        
        //컬렉션뷰는 FlowLayout이 있어야 생성이 가능하기에 FlowLayout객체를 컬렉션뷰에 넣어주기.
        let layout = UICollectionViewFlowLayout()
        //내가 만든 HomeViewController를 선언. FlowLayout객체 넣으면서.
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        //루트뷰컨을 가지는 루트네비게이션컨을 선언.
        let rootNavigationController = UINavigationController(rootViewController: homeViewController)
        
        //윈도우의 진정한 루트뷰컨은 (홈뷰컨이란 루트뷰를 가진) 루트네비게이션컨트롤러이기에 이를 설정.
        self.window?.rootViewController = rootNavigationController
        //실제로 내가 설정한 값이 보이도록하여 마무리.
        self.window?.makeKeyAndVisible()
        */
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

