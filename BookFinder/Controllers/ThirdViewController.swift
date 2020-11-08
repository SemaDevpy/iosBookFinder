//
//  ThirdViewController.swift
//  BookFinder
//
//  Created by Syimyk on 11/6/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController{

    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var btn: UIButton!
    
    var sampleURL = ""
    var descrptn = ""
    
    var secondViewCtrl = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 5
        textView.isEditable = false
        textView.isSelectable = false
        if descrptn != " "{
            textView.text = descrptn
        }else{
            title = "No Description for this book"
        }
        
    }
    

    @IBAction func urlBtnTapped(_ sender: UIButton) {
        openURL(sampleURL)
    }
    
    
    func openURL(_ urlString : String){
        if let url = URL(string: urlString), !url.absoluteString.isEmpty{
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    

}
