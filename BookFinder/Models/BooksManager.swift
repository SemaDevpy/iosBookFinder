//
//  BooksManager.swift
//  BookFinder
//
//  Created by Syimyk on 11/3/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol BooksManagerDelegate {
    func didUpdateBook(_ booksManager : BooksManager,books: [BookModel])
    func didFailWithError(error : Error)
}


struct BooksManager {

    var delegate : BooksManagerDelegate?
    
    var bookURL = "https://www.googleapis.com/books/v1/volumes?&key=AIzaSyAI2x4ns5T7AJfZOw4Pi2MJFFJmy9LELT0&"
    
    func fetchBooks(by text : String){
        var newText = ""
        if text.contains(" "){
            newText = text.replacingOccurrences(of: " ", with: "%20")
        }else{
            newText = text
        }
        let urlString = "\(bookURL)q=\(newText)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString : String){
        AF.request(urlString).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                var books =  [BookModel]()
                
                for (key,subJson) : (String , JSON) in json["items"]{
                    //getting all titles
                    let title = subJson["volumeInfo"]["title"].stringValue
                    //getting all authors
                    var newArray = [String]()
                    if let authors = subJson["volumeInfo"]["authors"].array{
                        for item in authors{
                            newArray.append(item.stringValue)
                        }
                    }
                    //getting all publishers
                    let publisher = subJson["volumeInfo"]["publisher"].stringValue
                    //get all previewlinks for books
                    let previewLink = subJson["volumeInfo"]["previewLink"].stringValue
                    //getting all links of images of books
                    var newLink = " "
                    if let imageLink = subJson["volumeInfo"]["imageLinks"]["thumbnail"].string{
                        newLink = imageLink
                    }else{
                        newLink = " "
                    }
                    //getting all descriptions for books
                    var description = " "
                    if let descrptn =  subJson["volumeInfo"]["description"].string{
                        description = descrptn
                    }else{
                        description = " "
                    }
                    //creating bookModel object
                    let book = BookModel(titleOfBook: title, authors: newArray, publisher: publisher, imageLink: newLink, description: description, previewLink: previewLink)
                    books.append(book)
                    self.delegate?.didUpdateBook(self, books: books)
                }
                

                
                
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    
}
