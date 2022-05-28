//
//  DetayRouter.swift
//  FoodApp
//
//  Created by İrem Çaltı on 22.05.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
       
        let presenter = DetayPresenter()
        
        //View
        ref.DetayPresenterNesnesi = presenter
        
        //Presenter
        ref.DetayPresenterNesnesi?.DetayInteractor = DetayInteractor()
       
        
       
    }
    
}
