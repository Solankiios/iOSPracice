//
//  ClothesCollectionViewCell.swift
//  Company-Project
//
//  Created by Parth Solanki on 10/04/23.
//

import UIKit

protocol LikeButtonState {
    func onLikeButtonClick(_ index: Int) -> Bool
}

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
    
    var isLiked: Bool = false
    
    var delegate: LikeButtonState?
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: INTERNAL FUNCTIONS
    func configCell(data: ClothDetails) {
        clothImage.image = UIImage(named: data.clothImage)
        clothtype.text = data.clothtype
        clothName.text = data.clothName
        clothPrice.attributedText = getPrice(price: data.clothPrice)
        clothDiscout.text = "₹\(data.discount)% off"
        clothDPrice.text = getDiscountedPrice(price: data.clothPrice, discount: data.discount)
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
    
    @IBAction func likeBtnTouch(_ sender: Any) {
         guard let delegate = delegate else { return }
        likeBtn.tintColor = delegate.onLikeButtonClick(likeBtn.tag) ? .red : .gray
    }
}
