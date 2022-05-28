//
//  SepetPresenter.swift
//  FoodApp
//
//  Created by İrem Çaltı on 24.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    func sil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    var sepetView: PresenterToViewSepetProtocol?
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
   
    func al( kullanici_adi: String) {
        sepetInteractor?.yemekAl(kullanici_adi: kullanici_adi)
        
    }
}

extension SepetPresenter:InteractorToPresenterSepetProtocol {
        func presenteraVeriGonder(yemeklerListe: Array<SepettekiYemekler>) {
            sepetView?.vieweVeriGonder(yemeklerListe: yemeklerListe)
        }
    }
        


