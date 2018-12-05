//
//  ViewController.swift
//  test
//
//  Created by udn on 2018/11/28.
//  Copyright © 2018 dengli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [String] = [
        "First Row",
        "Second Row",
        "Third Row",
        "Fourth Row",
        "Fifth Row",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "MyTable"
        let xib = UINib(nibName: String(describing: InfoCell.self), bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: String(describing: InfoCell.self))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow?.row {
            destination.titleName = dataArray[indexPath]
            destination.indexPath = indexPath
            destination.originVC = self
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoCell.self), for: indexPath) as? InfoCell else { return UITableViewCell() }
        cell.leftLabel.text = dataArray[indexPath.row]
//        cell.textLabel?.text = dataArray[indexPath.row]
        cell.accessibilityIdentifier = String(indexPath.row)
        return cell
    }
}
