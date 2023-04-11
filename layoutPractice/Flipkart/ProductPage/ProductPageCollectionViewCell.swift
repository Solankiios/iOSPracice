//
//  ProductPageCollectionViewCell.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit

class ProductPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var clothtype: UILabel!
    @IBOutlet weak var offerTable: UITableView!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    @IBOutlet weak var clothName: UILabel!
    
    static let idenitifier = "productPageCell"
    static func nib() -> UINib {
        return UINib(nibName: "ProductPageCollectionViewCell" , bundle: nil)
    }
    
    let data = ["hello ", "name", "this is not", "real data"]
    var retrievedOffers: [String]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        offerTable.register(OfferTableViewCell.nib(), forCellReuseIdentifier: OfferTableViewCell.identifier)
        offerTable.dataSource = self
      
    }
}

extension ProductPageCollectionViewCell {
    
    //MARK: INTERNAL FUNCTIONS
    func configCell(data: ClothDetails?) {
        clothtype.text = data?.clothtype
        clothName.text = data?.clothName
        totalPrice.attributedText = getPrice(price: data?.clothPrice ?? 0)
        discount.text = "₹\(data?.discount ?? 0)% off"
        discountedPrice.text = getDiscountedPrice(price: data?.clothPrice ?? 0, discount: data?.discount ?? 0)
        retrievedOffers = data?.offers
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
}

extension ProductPageCollectionViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.identifier, for: indexPath) as? OfferTableViewCell else { return UITableViewCell() }
        cell.configCell(data: data[indexPath.row] ?? String())
        return cell
    }
}
