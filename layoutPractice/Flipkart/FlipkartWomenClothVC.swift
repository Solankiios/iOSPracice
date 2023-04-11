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
        ClothDetails(clothImage: "blacktop", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 1199, discount: 53,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "whitetop", clothtype: "Aelomart", clothName: "Casual Half Sleeve Stripped Top", clothPrice: 1599, discount: 75,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "pinktop", clothtype: "Aurelia", clothName: "Pink Top", clothPrice: 1999, discount: 65,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "women4", clothtype: "Rare", clothName: "Printed Straight Women's Kurti", clothPrice: 1999, discount: 70,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "brucellatop", clothtype: "Rare", clothName: "Brucella Top", clothPrice: 3000, discount: 56,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "orangetop", clothtype: "Rare", clothName: "Orange Top", clothPrice: 2000, discount: 45,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "women5", clothtype: "Rare", clothName: "Kurti", clothPrice: 1999, discount: 70,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "coffeetop", clothtype: "Rare", clothName: "Coffee", clothPrice: 800, discount: 30,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "women5", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 5999, discount: 60,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "women4", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 2999, discount: 59,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
        ClothDetails(clothImage: "women5", clothtype: "Rare", clothName: "Solid Black Tops", clothPrice: 999, discount: 76,liked: false, images: ["blacktop", "whitetop", "pinktop"]),
    ]
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
    
    //MARK: FUNCTIONS
    
    func intialSetup() {
        clothesCollectionView.register(HeaderFlipkart.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderFlipkart.identifier)
        clothesCollectionView.register(ClothesCollectionViewCell.nib(), forCellWithReuseIdentifier: ClothesCollectionViewCell.identifier)
        clothesCollectionView.delegate = self
        clothesCollectionView.dataSource = self
        
        //        let appearance = UIBarAppearance()
        //        navigationItem.standardAppearance = appearance
    }
    
}

//MARK: EXTENSIONS

extension FlipkartWomenClothVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    //SETTING UP CELL
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let clothCell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothesCollectionViewCell.identifier, for: indexPath) as? ClothesCollectionViewCell else { return UICollectionViewCell() }
        clothCell.configCell(data: data[indexPath.row])
        clothCell.likeTap = {
            self.data[indexPath.row].liked = !self.data[indexPath.row].liked
            clothCell.likeBtn.tintColor = self.data[indexPath.row].liked ? .red : .gray
        }
        
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

extension FlipkartWomenClothVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let flipkartStoryboard = UIStoryboard(name: "FlipkartStoryboard", bundle: nil)
        guard let productVC = flipkartStoryboard.instantiateViewController(withIdentifier: "ProductVC") as? ProductVC else { return  }
        productVC.retriedData = data[indexPath.row]
        self.navigationController?.pushViewController(productVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2, height: view.frame.size.width - 120)
    }
}

extension FlipkartWomenClothVC: UICollectionViewDelegateFlowLayout {
}
