//
//  ViewController.swift
//  Counter
//
//  Created by Cesar Gamez on 2/15/22.
//

import UIKit

class ViewController: UIViewController {
    var countNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count.text = String(countNum)
    }

    @IBOutlet weak var count: UILabel!
    
    @IBAction func minus(_ sender: Any) {
        countNum = countNum - 1
        count.text = String(countNum)

    }
    @IBAction func add(_ sender: Any) {
        countNum = countNum + 1
        count.text = String(countNum)
    }
}

