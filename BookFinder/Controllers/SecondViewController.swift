//
//  SecondViewController.swift
//  BookFinder
//
//  Created by Syimyk on 11/2/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit
import SDWebImage

class SecondViewController: UIViewController {
    
    
    var booksManager = BooksManager()
    
    var books =  [BookModel]()
    
    var searchResult = ""
    
    @IBOutlet weak var table: UITableView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksManager.delegate = self
        table.delegate = self
        table.dataSource = self
        booksManager.fetchBooks(by: searchResult)
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    
  
    
}


//MARK: - UITableViewDataSource, UITableViewDelegate
extension SecondViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MyCellTableViewCell
        cell.titleLabel.text = "Title: \(books[indexPath.row].titleOfBook)"
        var newAuthorsString = ""
        for item in books[indexPath.row].authors{
            newAuthorsString.append(item)
        }
        cell.authorsLabel.text = "Authors: \(newAuthorsString)"
        cell.publisherLabel.text = "Publisher: \(books[indexPath.row].publisher)"
        cell.bookImage.sd_setImage(with: URL(string: books[indexPath.row].imageLink), completed: nil)
        return cell
    }
    
    
}

//MARK: - BooksManagerDelegate
extension SecondViewController : BooksManagerDelegate{
    func didUpdateBook(_ booksManager: BooksManager, books: [BookModel]) {
        self.books = books
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
       print(error)
    }
    
    
}
