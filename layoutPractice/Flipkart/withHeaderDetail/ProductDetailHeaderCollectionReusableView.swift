//
//  ProductDetailHeaderCollectionReusableView.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit

class ProductDetailHeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "productDetailsHeader"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configHeader() {
        
    }
}
