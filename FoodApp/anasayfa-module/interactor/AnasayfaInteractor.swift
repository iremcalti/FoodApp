//
//  AnasayfaInteractor.swift
//  FoodApp
//
//  Created by İrem Çaltı on 21.05.2022.
//

import Foundation


class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    func yemekleriAl() {
        
    let url = URL (string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        URLSession.shared.dataTask(with: url){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(YemekCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }
             }catch{ print(error.localizedDescription)}
        }.resume()
        

        
    }
}
    
