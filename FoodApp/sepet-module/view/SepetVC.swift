//
//  SepetVC.swift
//  FoodApp
//
//  Created by İrem Çaltı on 21.05.2022.
//

import UIKit
import Kingfisher

class SepetVC: UIViewController {
    
   

    
        @IBOutlet weak var sepetTableViewCell: UITableView!
    var yemeklerListe = [SepettekiYemekler]()
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableViewCell.delegate = self
        sepetTableViewCell.dataSource = self
        SepetRouter.createModule(ref: self)
        
        

        sepetTableViewCell.separatorColor = UIColor(white: 0.95, alpha: 1)
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.al(kullanici_adi: "irem")
    }
    
    @IBAction func buttonOnayla(_ sender: Any) {
     
    }
}
   

    extension SepetVC : PresenterToViewSepetProtocol {
        
        func vieweVeriGonder(yemeklerListe: Array<SepettekiYemekler>) {
            self.yemeklerListe = yemeklerListe
            print(yemeklerListe)
            DispatchQueue.main.async {
                self.sepetTableViewCell.reloadData()
                
            }
        }
    }
extension SepetVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(yemeklerListe.count)
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        
        hucre.labelYemekAd.text = yemek.yemek_adi
        hucre.labelYemekFiyat.text = "\(Int(yemek.yemek_siparis_adet!)! * Int(yemek.yemek_fiyat!)!)" + " ₺"
        hucre.sepetImage.image = UIImage(named: yemek.yemek_resim_adi!)
        hucre.labelYemekAdet.text = "\(yemek.yemek_siparis_adet!)" 
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + (yemeklerListe[indexPath.row].yemek_resim_adi!))
        
        hucre.sepetImage.kf.setImage(with: url)
        
        return hucre
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { (action,view,void) in
            self.sepetPresenterNesnesi!.sil(sepet_yemek_id: Int(self.yemeklerListe[indexPath.row].sepet_yemek_id!)!, kullanici_adi: "irem")
  
    }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
        
