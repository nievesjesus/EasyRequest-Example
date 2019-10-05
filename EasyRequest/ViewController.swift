//
//  ViewController.swift
//  EasyRequest
//
//  Created by Jesus Nieves on 05/10/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var models = [RedditModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 84
        self.getRedditPost()
    }

    private func getRedditPost() {
        EasyRequest<[RedditModel]>.get(self, path: "data.children", url: "https://www.reddit.com/top.json?limit=50") { (posts) in
            self.models = posts
            DispatchQueue.main.async() {
                self.tableView.reloadData()
            }
        }
    }
}


extension ViewController: EasyRequestDelegate {

    func onError() {
        DispatchQueue.main.async() {
            let alert = UIAlertController(title: "Ups", message: "An error has occurred...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = self.models[indexPath.row].data.title
        return cell
    }
    
    
}
