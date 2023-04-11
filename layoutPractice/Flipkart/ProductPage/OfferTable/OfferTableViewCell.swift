//
//  OfferTableViewCell.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    static let identifier = "OfferTableCell"
    static func nib() -> UINib {
        return UINib(nibName: "OfferTableViewCell", bundle: nil)
    }
    @IBOutlet weak var offer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(data: String) {
        offer.addLeading(image: UIImage(systemName: "tag") ?? UIImage(), text: data)
    }
}
