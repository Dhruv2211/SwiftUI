//
//  ResulltsViewController.swift
//  Tipsy
//
//  Created by Dhruv Pujara on 05/04/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResulltsViewController: UIViewController {
    
    var result = ""
    var tip = 10
    var people = 2

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(people) people, with \(tip) tip."

        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

   
    }
    */

}
