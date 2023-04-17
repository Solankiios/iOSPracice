//
//  CollectionReusableView.swift
//  Company-Project
//
//  Created by Parth Solanki on 10/04/23.
//

import UIKit

class HeaderFlipkart: UICollectionReusableView {
    
    //MARK: IBOUTLETS
    @IBOutlet private weak var sortBtn: UIButton!
    @IBOutlet private weak var filterBtn: UIButton!
    
    //MARK: LOCAL VARIABLES
    static let identifier = "HeaderFlipkart"
    
    
    //MARK: LIFECYCLES
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: FUNCTIONS
    func configCell() {
        //STACKVIEW
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
        //SORT BUTTON
        let sortBtn = UIButton(type: .system)
        sortBtn.titleLabel?.text = "Sort"
        sortBtn.setTitle("Sort", for: .normal)
        sortBtn.backgroundColor = UIColor.white
        sortBtn.tintColor = UIColor.black
        sortBtn.setImage(UIImage(systemName: "arrow.down.doc"), for: .normal)
        
        //FILTER BUTTON
        let filterButton = UIButton(type: .system)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.backgroundColor = UIColor.white
        filterButton.tintColor = UIColor.black
        filterButton.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        
        stackView.addArrangedSubview(sortBtn)
        stackView.addArrangedSubview(filterButton)
    }
    
}
