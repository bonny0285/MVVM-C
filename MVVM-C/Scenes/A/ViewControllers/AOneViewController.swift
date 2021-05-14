//
//  AOneViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class AOneViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "A-1"
        tabBarController?.tabBarItem.title = "A"
        view.backgroundColor = .red
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
