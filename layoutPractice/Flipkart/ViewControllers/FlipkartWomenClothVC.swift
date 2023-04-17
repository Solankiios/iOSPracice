//
//  FlipkartWomenClothVC.swift
//  Company-Project
//
//  Created by Parth Solanki on 10/04/23.
//

import UIKit

class FlipkartWomenClothVC: UIViewController {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var clothesCollectionView: UICollectionView!
    
    //MARK: LOCAL VARIABLES
    var data: [ClothDetails] = [
        ClothDetails(clothImage: "blacktop", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 1199, discount: 53,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >"], reviewNumbers: 202033, sizes: [.L, .M, .S,.XL,.XXL],rating: 4.3),
        ClothDetails(clothImage: "whitetop", clothtype: "Aelomart", clothName: "Casual Half Sleeve Stripped Top", clothPrice: 1599, discount: 75,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC aLfkADKLgnadklnklsNKLDNBKLDBNKLNfklsndklsbnfklsbnfklrndfklbg>","adsdsklgndskladnskvndsvsklvnsdklvnsklvnsklvndsklvnszklvnszklvndszklvnk", "dsasdd","adggagag","Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "orangetop", clothtype: "Aurelia", clothName: "Pink Top", clothPrice: 1999, discount: 65,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "women4", clothtype: "Rare", clothName: "Printed Straight Women's Kurti", clothPrice: 1999, discount: 70,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "blacktop", clothtype: "Rare", clothName: "Brucella Top", clothPrice: 3000, discount: 56,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "orangetop", clothtype: "Rare", clothName: "Orange Top", clothPrice: 2000, discount: 45,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "women5", clothtype: "Rare", clothName: "Kurti", clothPrice: 1999, discount: 70,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "blacktop", clothtype: "Rare", clothName: "Coffee", clothPrice: 800, discount: 30,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "women5", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 5999, discount: 60,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "blacktop", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 2999, discount: 59,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
        ClothDetails(clothImage: "women5", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 999, discount: 76,liked: false, images: ["blacktop", "whitetop", "pinktop"], offers: ["Flat 10% off* with digibank by CBC >", "Extra 5% off Axis Bank Buzz credit Card"], reviewNumbers: 202033, sizes: [.L, .M, .S],rating: 4.3),
    ]
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
    
    //MARK: FUNCTIONS
    private func intialSetup() {
        clothesCollectionView.register(HeaderFlipkart.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFlipkart.identifier)
        clothesCollectionView.register(ClothesCollectionViewCell.nib(), forCellWithReuseIdentifier: ClothesCollectionViewCell.identifier)
        clothesCollectionView.delegate = self
        clothesCollectionView.dataSource = self
    }
}

//MARK: UICollectionViewDataSource
extension FlipkartWomenClothVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    //SETTING UP CELL
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let clothCell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothesCollectionViewCell.identifier, for: indexPath) as? ClothesCollectionViewCell else { return UICollectionViewCell() }
        clothCell.configCell(data: data[indexPath.row])
        clothCell.likeBtn.tag = indexPath.row
        clothCell.delegate = self
        return clothCell
    }
    
    //SETTING UP HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFlipkart.identifier, for: indexPath) as? HeaderFlipkart else { return UICollectionReusableView() }
        header.configCell()
        return header
    }
    
    //HEIGHT OF HEADER
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
}

//MARK: COLLECTIONVIEW DELEGATE
extension FlipkartWomenClothVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let flipkartStoryboard = UIStoryboard(name: "FlipkartStoryboard", bundle: nil)
        guard let productVC = flipkartStoryboard.instantiateViewController(withIdentifier: "ProductPageController") as? ProductDetailsVC else { return  }
        productVC.retrievedData = data[indexPath.row]
        self.navigationController?.pushViewController(productVC, animated: true)
    }
    
}

//MARK: DELEGATE FOR BUTTON OF LIKE
extension FlipkartWomenClothVC: LikeButtonState {
    func onLikeButtonClick(_ index: Int) -> Bool {
        data[index].liked.toggle()
        return data[index].liked
    }
}
