//
//  RentalsController.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

import UIKit

class RentalsController: UIViewController {

    private lazy var rentalsView = RentalsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = rentalsView
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
