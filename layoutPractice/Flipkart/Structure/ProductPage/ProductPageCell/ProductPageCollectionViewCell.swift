//
//  ProductPageCollectionViewCell.swift
//  layoutPractice
//
//  Created by Solanki on 11/04/23.
//

import UIKit


protocol GetDetailDelegate {
    func reloadCollection()
}

protocol CollectionViewCellDelegate: AnyObject {
    func didSelect(_ title: String)
}

class ProductPageCollectionViewCell: UICollectionViewCell {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var clothtype: UILabel!
    @IBOutlet weak var offerTable: UITableView!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    @IBOutlet weak var clothName: UILabel!
    @IBOutlet weak var ImageCollection: UICollectionView!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var productImageControl: UIPageControl!
   // @IBOutlet weak var likeBtn: UIImageView!
    @IBOutlet weak var sSizebtn: UIButton!
    @IBOutlet weak var mSizebtn: UIButton!
    @IBOutlet weak var lSizebtn: UIButton!
    @IBOutlet weak var xlSizebtn: UIButton!
    @IBOutlet weak var xxlSizebtn: UIButton!
    @IBOutlet weak var heightforTable: NSLayoutConstraint!
    
    //MARK: STATIC VARIABLES
    static let idenitifier = "productPageCell"
    static func nib() -> UINib {
        return UINib(nibName: "ProductPageCollectionViewCell" , bundle: nil)
    }
    
    //MARK: LOCAL VARIABLES
    var retrievedOffers: [String]?
    var productsImages: [String]?
    var availableSizes: [sizesOfCloths] = []
    var getDetailDelegate: GetDetailDelegate?
    
    //MARK: LIFECYCLES
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
        print("awake")
        getDetailDelegate?.reloadCollection()
    }
    
    
    //MARK: IBACTIONS
    @IBAction func sSizeBtnTapped(_ sender: Any) {
        didSelect(sSizebtn.titleLabel?.text ?? String())
        setSelected(sender: sSizebtn)
    }
    
    @IBAction func mSizeBtnTapped(_ sender: Any) {
        didSelect(mSizebtn.titleLabel?.text ?? String())
        setSelected(sender: mSizebtn)
    }
    
    @IBAction func lSizeBtnTapped(_ sender: Any) {
        didSelect(lSizebtn.titleLabel?.text ?? String())
        setSelected(sender: lSizebtn)
    }
    
    @IBAction func xlSizeTapped(_ sender: UIButton) {
        didSelect(xlSizebtn.titleLabel?.text ?? String())
        setSelected(sender: xlSizebtn)
    }
    @IBAction func xxlSizeTapped(_ sender: UIButton) {
        didSelect(xxlSizebtn.titleLabel?.text ?? String())
        setSelected(sender: xxlSizebtn)
    }
    @IBAction func btnLikeTapped(_ sender: Any) {
        didSelect("")
    }
    
}

//MARK: EXTENSIONS
extension ProductPageCollectionViewCell {
    
    //MARK: INTERNAL FUNCTIONS
    private func initialSetup() {
        ImageCollection.tag = 1
        ImageCollection.register(ProductImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductImageCollectionViewCell.identifier)
        offerTable.register(OfferTableViewCell.nib(), forCellReuseIdentifier: OfferTableViewCell.identifier)
        ImageCollection.dataSource = self
        ImageCollection.delegate = self
        offerTable.dataSource = self
        productImageControl.currentPage = 0
        rating.layer.cornerRadius = 20
        rating.titleLabel?.textColor = .white
        rating.clipsToBounds = true
        
    }
    
    //Getting Data
    func configCell(data: ClothDetails?) {
        clothtype.text = data?.clothtype
        clothName.text = data?.clothName
        totalPrice.attributedText = getPrice(price: data?.clothPrice ?? 0)
        discount.text = "₹\(data?.discount ?? 0)% off"
        discountedPrice.text = getDiscountedPrice(price: data?.clothPrice ?? 0, discount: data?.discount ?? 0)
        retrievedOffers = data?.offers
        productsImages = data?.images
        availableSizes = data?.sizes ?? []
        productImageControl.numberOfPages = productsImages?.count ?? 0
        reviews.text = "\(data?.reviewNumbers ?? 0) reviews"
   //     likeBtn.tintColor = data?.liked ?? false ? .red : .gray
        lblSize.text = "Bust 42' | Waist 40' Select Size"
        configSizes()
     //   heightforTable.constant = CGFloat((retrievedOffers?.count ?? 0) * 24)
        offerTable.layoutIfNeeded()
        heightforTable.constant = offerTable.contentSize.height
//        offerTable.performBatchUpdates(nil)
//        GetDetailDelegate?.getTableHeight(height: offerTable.contentSize.height)
    }
    
    //MARK: PRIVATE FUNCTIONS
    //For getting Discounted Price
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
//MARK: TABLE DELEGATE
extension ProductPageCollectionViewCell: UITableViewDelegate {
    
}
//MARK: TABLE DATA SOURCE
extension ProductPageCollectionViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return retrievedOffers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.identifier, for: indexPath) as? OfferTableViewCell else { return UITableViewCell() }
        cell.configCell(data: retrievedOffers?[indexPath.row] ?? String())
        return cell
    }
}

//MARK: COLLECTIONVIEW DATA SOURCE
extension ProductPageCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImageCollectionViewCell.identifier, for: indexPath) as? ProductImageCollectionViewCell else { return UICollectionViewCell() }
        productImageCell.ConfigCell(data: productsImages?[indexPath.row] ?? String(), liked: false)
        return productImageCell
    }
    
    //MARK: For Page Control
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        productImageControl.currentPage = indexPath.row
    }
}

//MARK: COLLECTIONVIEW DELEGATE
extension ProductPageCollectionViewCell: UICollectionViewDelegate {
}

//MARK: COLLECTIONVIEW FLOW DELEGATE
extension ProductPageCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

//MARK: DELEGATE FOR GETTING SIZES OF CLOTH
extension ProductPageCollectionViewCell {
    private func configSizes() {
        availableSizes.forEach {
            if sSizebtn.titleLabel?.text == $0.rawValue {
                sSizebtn.isEnabled = true
            } else if mSizebtn.titleLabel?.text == $0.rawValue {
                mSizebtn.isEnabled = true
            } else if lSizebtn.titleLabel?.text == $0.rawValue {
                lSizebtn.isEnabled = true
            } else if xlSizebtn.titleLabel?.text == $0.rawValue {
                xlSizebtn.isEnabled = true
            } else if xxlSizebtn.titleLabel?.text == $0.rawValue {
                xxlSizebtn.isEnabled = true
            } else {
                
            }
        }
    }
    //Updating selected Size
    private func didSelect(_ title: String) {
        lblSize.text = "Bust 42' | Waist 40' | \(title)"
    }
    //Clear Button and set new Button Selected
    private func setSelected(sender: UIButton) {
        sSizebtn.layer.borderColor = UIColor.black.cgColor
        mSizebtn.layer.borderColor = UIColor.black.cgColor
        lSizebtn.layer.borderColor = UIColor.black.cgColor
        xlSizebtn.layer.borderColor = UIColor.black.cgColor
        xxlSizebtn.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderColor = UIColor.blue.cgColor
    }
}
