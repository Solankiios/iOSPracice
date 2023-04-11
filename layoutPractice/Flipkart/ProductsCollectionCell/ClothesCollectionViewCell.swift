//
//  ClothesCollectionViewCell.swift
//  Company-Project
//
//  Created by Parth Solanki on 10/04/23.
//

import UIKit

class ClothesCollectionViewCell: UICollectionViewCell {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var clothImage: UIImageView!
    @IBOutlet weak var clothtype: UILabel!
    @IBOutlet weak var clothName: UILabel!
    @IBOutlet weak var clothPrice: UILabel!
    @IBOutlet weak var clothDPrice: UILabel!
    @IBOutlet weak var clothDiscout: UILabel!
    @IBOutlet weak var outerView: UIView!
    
    
    //MARK: LOCAL VARIABLES
    static let identifier = "ClothesCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ClothesCollectionViewCell", bundle: nil)
    }
    
    var likeTap: (() -> ())?
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        likeBtn.addTarget(self, action: #selector(likeCloth(_:)), for: .touchUpInside)
    }
    
    
    //MARK: INTERNAL FUNCTIONS
    func configCell(data: ClothDetails) {
        clothImage.image = UIImage(named: data.clothImage)
        clothtype.text = data.clothtype
        clothName.text = data.clothName
        clothPrice.attributedText = getPrice(price: data.clothPrice)
        clothDiscout.text = "₹\(data.discount)% off"
        clothDPrice.text = getDiscountedPrice(price: data.clothPrice, discount: data.discount)
        //outerView.layer.borderWidth = 0.5
        //outerView.layer.borderColor = UIColor.gray.cgColor
        
        
    }
    //MARK: PRIVATE FUNCTIONS
    private func getDiscountedPrice(price: Int, discount: Int) -> String {
        let dPrice = price * discount / 100
        return "₹\(price - dPrice - 1)"
    }
    
    private func getPrice(price: Int) -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "₹\(price)")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
    
    
    @IBAction private func likeCloth(_ sender: UIButton) {
        guard let likeTap else { return }
        likeTap()
    }
}

