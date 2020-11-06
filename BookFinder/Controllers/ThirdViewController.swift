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
        textView.text = descrptn
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
