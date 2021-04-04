//
//  ViewController.swift
//  Project1
//
//  Created by luis flores on 4/3/21.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: Properties
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        items.forEach {
            if $0.hasPrefix("nssl") {
                pictures.append($0)
            }
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let selectedImage = pictures[indexPath.row]
        detailVC.selectedImage = selectedImage
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

