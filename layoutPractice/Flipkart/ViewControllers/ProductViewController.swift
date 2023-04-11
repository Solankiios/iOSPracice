//
//  ProductViewController.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productCollectionTable: UICollectionView!

    var retriedData: ClothDetails?
    var productimages: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionTable.register(ProductDetailHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductDetailHeaderCollectionReusableView.identifier)
        productCollectionTable.register(ProductPageCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductPageCollectionViewCell.idenitifier)
        productCollectionTable.dataSource = self
        productCollectionTable.delegate = self
    }
}

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductPageCollectionViewCell.idenitifier, for: indexPath) as? ProductPageCollectionViewCell else { return UICollectionViewCell() }
        productCell.configCell(data: retriedData)
        return productCell
    }
    
    //SETTING UP HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductDetailHeaderCollectionReusableView.identifier, for: indexPath) as? ProductDetailHeaderCollectionReusableView else { return UICollectionReusableView() }
        header.configHeader()
        return header
    }
    //HEIGHT OF HEADER
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 300)
    }

    
}
extension ProductViewController: UICollectionViewDelegate {
    
}
