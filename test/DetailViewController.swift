//
//  DetailViewController.swift
//  test
//
//  Created by udn on 2018/11/28.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var DVImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    weak var originVC: ViewController?
    var titleName = ""
    var indexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleName
        
        navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = newBackButton
        
        DVImage.kf.setImage(with: URL(string: "https://reading.udn.com/appspace/thought/1001/cover.jpg")!)
    }
    
    @objc func handleBack() {
        if let text = textField.text {
            originVC?.dataArray[indexPath] = text
            originVC?.tableView.reloadRows(at: [IndexPath(row: indexPath, section: 0)], with: .automatic)
        }
        navigationController?.popViewController(animated: true)
    }

    deinit {
        print(String(describing: self) + " deinited.")
    }
}
