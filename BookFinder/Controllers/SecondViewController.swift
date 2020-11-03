//
//  SecondViewController.swift
//  BookFinder
//
//  Created by Syimyk on 11/2/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var booksArray : [BookModel] = []
    
    var searchResult = ""
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
    }
    
    
  
    
}


//MARK: - UITableViewDataSource, UITableViewDelegate
extension SecondViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MyCellTableViewCell
        cell.titleLabel.text = "Title: Twilight"
        cell.authorsLabel.text = "Author: Stephenie Meyer"
        cell.publisherLabel.text = "Publisher: Scribner"
        cell.bookImage.image = UIImage(named: "twilight")
        return cell
    }
    
    
}
