//
//  ProductImageCollectionViewCell.swift
//  Company-Project
//
//  Created by Parth Solanki on 12/04/23.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var productImageView: UIImageView!
    
    //MARK: LOCAL VARIABLES
    static let identifier = "ProductImageCell"
    static func nib() -> UINib {
        return UINib(nibName: "ProductImageCollectionViewCell", bundle: nil)
        
    }
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK: FUNCTIONS
    func ConfigCell(data: String, liked: Bool) {
        productImageView.image = UIImage(named: data)
    }
}
