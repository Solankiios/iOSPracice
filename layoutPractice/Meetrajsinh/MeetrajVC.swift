//
//  MeetrajVC.swift
//  layoutPractice
//
//  Created by Solanki on 08/04/23.
//

import UIKit

class MeetrajVC: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var jobsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        jobsTable.delegate = self
        jobsTable.dataSource = self
        }
}


extension MeetrajVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension MeetrajVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeatureJobCellTableViewCell.identifier, for: indexPath) as? FeatureJobCellTableViewCell else { return UITableViewCell() }
        return cell
    }
}


extension MeetrajVC {
    func setupView() {
        lblName.text = "Rifat Sarkar 👋"
        let searchImage = UIImage(systemName: "magnifyingglass")
        let imageView =  UIImageView(image:searchImage)
        imageView.frame = CGRect(x: 10, y: 0, width: 15, height: 15)
        imageView.contentMode = .center
        imageView.tintColor = .gray
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        containerView.addSubview(imageView)
        txtSearch.leftView = containerView
        txtSearch.leftViewMode = .always
    }
}
