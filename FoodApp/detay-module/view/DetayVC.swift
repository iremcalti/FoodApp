//
//  DetayVC.swift
//  FoodApp
//
//  Created by İrem Çaltı on 21.05.2022.
//

import UIKit
import SwiftUI
import Kingfisher

class DetayVC: UIViewController {
    @IBOutlet weak var yemekImage: UIImageView!
        
        @IBOutlet weak var stepper: UIStepper!
        @IBOutlet weak var labelYemekAd: UILabel!
        @IBOutlet weak var labelStepper: UILabel!
        
        @IBOutlet weak var labelYemekFiyat: UILabel!
    
    var yemek:Yemekler?
    var DetayPresenterNesnesi:ViewToPresenterDetayProtocol?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper.minimumValue = 1
        
        if let y = yemek {
            labelYemekAd.text = y.yemek_adi
            labelYemekFiyat.text = y.yemek_fiyat! + " ₺"
           // labelYemekFiyat.text = Int((yemek?.yemek_fiyat!)! + Int(labelStepper!)!
            
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + (y.yemek_resim_adi!))
            
            yemekImage.kf.setImage(with: url)
            
        }
        
        labelStepper.text = String(Int(stepper.value))
        DetayRouter.createModule(ref: self)
       
        
    }
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let ya = yemek?.yemek_adi, let yf = yemek?.yemek_fiyat, let yr = yemek?.yemek_resim_adi ,let yt = labelStepper.text {
            
            DetayPresenterNesnesi?.ekle(yemek_adi: ya, yemek_resim_adi: yr, yemek_fiyat: Int(yf)!, yemek_siparis_adet: Int(yt)!, kullanici_adi: "irem")
        }
            
    }
    @IBAction func StepperDegisimKontrol(_ sender: UIStepper) {
        labelStepper.text = String(sender.value)
        labelStepper.text = String(Int(sender.value))
        //labelYemekFiyat.text = "\(Int((yemek?.yemek_fiyat!)! * Int(labelStepper!)!)"

    
}
}


