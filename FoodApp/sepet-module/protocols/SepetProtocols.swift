//
//  SepetProtocols.swift
//  FoodApp
//
//  Created by İrem Çaltı on 24.05.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func al(kullanici_adi:String)
    func sil(sepet_yemek_id: Int, kullanici_adi :String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func yemekAl(kullanici_adi:String)
    func yemekSil(sepet_yemek_id: Int, kullanici_adi :String)
}
protocol InteractorToPresenterSepetProtocol {
    
    func presenteraVeriGonder(yemeklerListe:Array<SepettekiYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemeklerListe:Array<SepettekiYemekler>)
}


protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}

