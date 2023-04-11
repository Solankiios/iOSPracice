//
//  ProductsImagesVCell.swift
//  layoutPractice
//
//  Created by Solanki on 10/04/23.
//

import UIKit

class ProductsImagesVCell: UICollectionViewCell {
    
    static let identifier = "ProductsVCell"
    
    @IBOutlet weak var productImage: UIImageView!
    
    func configCell(data: String) {
        productImage.image = UIImage(named: data)
    }
}
