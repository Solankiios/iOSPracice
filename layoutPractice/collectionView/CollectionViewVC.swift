//
//  CollectionViewVC.swift
//  layoutPractice
//
//  Created by Solanki on 09/04/23.
//

import UIKit

class CollectionViewVC: UIViewController {
    
    @IBOutlet weak var jobCollectionView: UICollectionView!
    
    let jobs: [feautureJob] = [
        feautureJob(designation: "Junior Executive", companyName: "Shell plc", companyImage: "Apple-logo", salary: "$98,00/year", jobplace: "Texas, USA", jobdescriptions: ["Administration", "Full-time", "Junior"]),
        feautureJob(designation: "Executive", companyName: "Shell plc", companyImage: "Google-logo", salary: "$55,00/year", jobplace: "Texas, USA", jobdescriptions: ["Administration", "Full-time", "Junior"]),
        feautureJob(designation: "Developer", companyName: "Shell plc", companyImage: "Gmail-logo", salary: "$67,00/year", jobplace: "Texas, USA", jobdescriptions: ["React", "Full-time", "Junior"]),
        feautureJob(designation: "QA Engineer", companyName: "Shell plc", companyImage: "Yahoo-logo", salary: "$45,00/year", jobplace: "Texas, USA", jobdescriptions: ["Manual", "Full-time", "Junior"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 380, height: 216)
        layout.scrollDirection = .horizontal
        jobCollectionView.collectionViewLayout = layout
        jobCollectionView.dataSource = self
        jobCollectionView.delegate = self
    }
}

extension CollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturejobCVC.identifier, for: indexPath) as? FeaturejobCVC else { return UICollectionViewCell() }
        cell.configCell(data: jobs[indexPath.row])
        return cell
    }
}

extension CollectionViewVC: UICollectionViewDelegate {
    
}

extension CollectionViewVC: UICollectionViewDelegateFlowLayout {
 
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 380, height: 216)
//    }
}

