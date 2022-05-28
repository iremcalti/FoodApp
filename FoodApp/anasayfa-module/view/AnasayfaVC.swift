//
//  ViewController.swift
//  FoodApp
//
//  Created by İrem Çaltı on 21.05.2022.
//

import UIKit
import Kingfisher

class AnasayfaVC: UIViewController {

    

    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    
    var yemeklerListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 5
        tasarim.minimumInteritemSpacing = 5
        
        let genislik = yemeklerCollectionView.frame.size.width
        let hucreGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik)
        yemeklerCollectionView.collectionViewLayout = tasarim
        
       }

    override func viewWillAppear(_ animated: Bool) {
        
        anasayfaPresenterNesnesi?.tumYemekleriAl()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemek = yemek
            }
            
    }
    }
   
        }

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}
extension AnasayfaVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       //let yemek = yemeklerListe[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! YemeklerCollectionViewCell
        
        hucre.layer.cornerRadius = 10
       
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/" + (yemeklerListe[indexPath.row].yemek_resim_adi!))
        
        hucre.yemekImageView.kf.setImage(with: url)
        
        hucre.yemekImageView.frame.size.height = hucre.yemekImageView.frame.width
        hucre.yemekAdiLabel.text = yemeklerListe[indexPath.row].yemek_adi
        hucre.yemekFiyatLabel.text = (yemeklerListe[indexPath.row].yemek_fiyat)! + " ₺"
       //hucre.yemekAdiLabel.text = "\(yemek.yemek_adi!)"
        
        return hucre
    }
   
}
