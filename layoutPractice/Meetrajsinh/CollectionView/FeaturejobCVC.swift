//
//  FeaturejobCollectionViewCell.swift
//  layoutPractice
//
//  Created by Solanki on 09/04/23.
//

import UIKit

class FeaturejobCVC: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyPlace: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var jobDesignation: UILabel!
    
    static let identifier = "featureCollectionCell"
    static func nib() -> UINib {
       return UINib(nibName: "FeaturejobCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data: feautureJob) {
        image.image = UIImage(named: data.companyImage)
        companyName.text = data.companyName
        place.text = data.jobplace
        price.text = data.salary
        jobDesignation.text = data.designation
    }
}
