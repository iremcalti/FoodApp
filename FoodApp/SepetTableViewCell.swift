//
//  SepetTableViewCell.swift
//  FoodApp
//
//  Created by İrem Çaltı on 24.05.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

   
    @IBOutlet weak var sepetImage: UIImageView!
    
    @IBOutlet weak var labelYemekAd: UILabel!
    
    @IBOutlet weak var labelYemekAdet: UILabel!
   
    @IBOutlet weak var labelYemekFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
