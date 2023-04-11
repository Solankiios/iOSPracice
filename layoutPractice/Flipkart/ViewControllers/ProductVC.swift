//
//  ProductVC.swift
//  layoutPractice
//
//  Created by Solanki on 10/04/23.
//

import UIKit

class ProductVC: UIViewController {

    @IBOutlet weak var productImageCollectionView: UICollectionView!
    @IBOutlet weak var productPageController: UIPageControl!
    
    @IBOutlet weak var clothtype: UILabel!
    @IBOutlet weak var offers2: UILabel!
    @IBOutlet weak var offers: UILabel!
    @IBOutlet weak var reviewNumbers: UILabel!
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var dPrice: UILabel!
    @IBOutlet weak var clothName: UILabel!
    
    var retriedData: ClothDetails?
    var productimages: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCell(data: retriedData!)
        productImageCollectionView.dataSource = self
        productImageCollectionView.delegate = self
        productPageController.currentPage = 0
        productPageController.numberOfPages = productimages?.count ?? 0
        
    }
    
    //MARK: IBACTIONS
    @IBAction func pagecontrollerchange(_ sender: Any) {
        
    }
}

extension ProductVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productimages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productcell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsImagesVCell.identifier, for: indexPath) as? ProductsImagesVCell else { return UICollectionViewCell() }
        productcell.configCell(data: productimages?[indexPath.row] ?? "")
        return productcell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        productPageController.currentPage = indexPath.row
    }
}

extension ProductVC: UICollectionViewDelegate {
    
}

extension ProductVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.layer.frame.size.width, height: view.layer.frame.size.width / 2 )
        }
}

extension ProductVC {
    
    func configCell(data: ClothDetails) {
        
        clothtype.text = data.clothtype
        clothName.text = data.clothName
        totalPrice.attributedText = getPrice(price: data.clothPrice)
        discount.text = "₹\(data.discount)% off"
        dPrice.text = getDiscountedPrice(price: data.clothPrice, discount: data.discount)
        productimages = data.images
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

