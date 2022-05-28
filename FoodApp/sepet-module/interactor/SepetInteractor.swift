//
//  SepetInteractor.swift
//  FoodApp
//
//  Created by İrem Çaltı on 24.05.2022.
//

import Foundation

class SepetInteractor : PresenterToInteractorSepetProtocol {
    func yemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")!)
      
        istek.httpMethod = "POST"
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
       
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do{
                let cevap = try JSONDecoder().decode(SepettenSilCevap.self, from: data!)
                print (cevap)
                self.yemekAl(kullanici_adi: "irem")
                
                
           
            }catch{print(error.localizedDescription)}
        }.resume()
    }
    

    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func yemekAl(kullanici_adi: String) {
        var istek = URLRequest(url: URL(string:"http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            do{
                let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data!)
               
                if let liste = cevap.sepet_yemekler {
                    self.sepetPresenter?.presenteraVeriGonder(yemeklerListe: liste)
                }
            }catch let error as DecodingError {
                switch error {
                case .typeMismatch(let key, let value):
                    print("error typeMismatch \(key),value \(value) and ERROR\(error.localizedDescription)")
                case .valueNotFound(let key, let value):
                    print("error valueNotFound \(key), value\(value) and ERROR\(error.localizedDescription)")
                case .keyNotFound(let key, let value):
                    print("error keyNotFound \(key), value\(value) and ERROR\(error.localizedDescription)")
                case .dataCorrupted(let key):
                    print("error valueNotFound \(key), and ERROR\(error.localizedDescription)")
                default:
                    print("ERROR: \(error.localizedDescription)")
                    
                }
                self.sepetPresenter?.presenteraVeriGonder(yemeklerListe: [])
            }catch{
                print(error.localizedDescription)
            
        }
        }.resume()
    }
}
