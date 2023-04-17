//
//  OfferTableViewCell.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit

class OfferTableViewCell: UITableViewCell {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var offer: UILabel!
    //MARK: LOCAL VARIABLES
    static let identifier = "OfferTableCell"
    static func nib() -> UINib {
        return UINib(nibName: "OfferTableViewCell", bundle: nil)
    }
    
    //MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: FUNCTIONS
    func configCell(data: String) {
        offer.addLeading(image: UIImage(systemName: "tag") ?? UIImage(), text: data)
    }
}
