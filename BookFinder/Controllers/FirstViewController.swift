//
//  ViewController.swift
//  BookFinder
//
//  Created by Syimyk on 11/2/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       addButton()
       
    }
    
    var textFieldBtn: UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: K.image), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(txtField.frame.size.width - 40), y: CGFloat(5), width: CGFloat(40), height: CGFloat(30))
        button.addTarget(self, action: #selector(self.refreshContent), for: .touchUpInside)
        return button
    }

    
    
    @objc func refreshContent(){
        performSegue(withIdentifier: K.segue, sender: self)
        txtField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        if let safeText = txtField.text{
            destinationVC.searchResult = safeText
        }
    }
    
    func addButton(){
        txtField.rightView = textFieldBtn
        txtField.rightViewMode = .always
    }
    
    

}

