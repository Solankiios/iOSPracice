//
//  ProductViewController.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var productCollectionTable: UICollectionView!
    
    //MARK: LOCAL VARIABLES
    var retrievedData: ClothDetails?
    var productimages: [String]?
    //MARK: LIFECYCLES
     override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionTable.register(ProductPageCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductPageCollectionViewCell.idenitifier)
        productCollectionTable.dataSource = self
        productCollectionTable.delegate = self
    }
    
}

//MARK: COLLECTIONVIEW DATASOURCE AND DELEGATE
extension ProductDetailsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductPageCollectionViewCell.idenitifier, for: indexPath) as? ProductPageCollectionViewCell else { return UICollectionViewCell() }
        print("in cell")
        productCell.configCell(data: retrievedData)
        //  collectionView.reloadData()
        DispatchQueue.main.async {
            collectionView.performBatchUpdates(nil)
        }
//        collectionView.layoutIfNeeded()
//        collectionView.layoutSubviews()
       
        return productCell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
                productCollectionTable.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                productCollectionTable.collectionViewLayout.invalidateLayout()
    }
}



extension ProductDetailsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productCollectionTable.reloadData()
    }
    
}

extension ProductDetailsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height:
                        max(view.bounds.height, collectionView.bounds.height) )
    }
    
}

extension ProductDetailsVC: GetDetailDelegate {
    func reloadCollection() {
        productCollectionTable.reloadData()
    }
}
