//
//  FeatureJobCellTableViewCell.swift
//  layoutPractice
//
//  Created by Solanki on 08/04/23.
//

import UIKit
import RswiftResources

class FeatureJobCellTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "featurejobcell"
    static func nib() -> UINib {
       return UINib(nibName: "FeatureJobCellTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(FeaturejobCVC.nib(), forCellWithReuseIdentifier: FeaturejobCVC.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  }
}

struct feautureJob {
    var designation: String
    var companyName: String
    var companyImage: String
    var salary: String
    var jobplace: String
    var jobdescriptions: [String]
}

let jobs: [feautureJob] = [
    feautureJob(designation: "Junior Executive", companyName: "Shell plc", companyImage: "Apple logo", salary: "$98,00/year", jobplace: "Texas, USA", jobdescriptions: ["Administration", "Full-time", "Junior"]),
    feautureJob(designation: "Executive", companyName: "Shell plc", companyImage: "Google-logo", salary: "$55,00/year", jobplace: "Texas, USA", jobdescriptions: ["Administration", "Full-time", "Junior"]),
    feautureJob(designation: "Developer", companyName: "Shell plc", companyImage: "Gmail-logo", salary: "$67,00/year", jobplace: "Texas, USA", jobdescriptions: ["React", "Full-time", "Junior"]),
    feautureJob(designation: "QA Engineer", companyName: "Shell plc", companyImage: "Yahoo-logo", salary: "$45,00/year", jobplace: "Texas, USA", jobdescriptions: ["Manual", "Full-time", "Junior"]),
]


extension FeatureJobCellTableViewCell: UICollectionViewDelegate {
    
}

extension FeatureJobCellTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturejobCVC.identifier, for: indexPath) as? FeaturejobCVC else { return UICollectionViewCell() }
        cell.configCell(data: jobs[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs.count
    }
    
}

extension FeatureJobCellTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
}

