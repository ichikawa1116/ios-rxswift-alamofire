//
//  TrackDetailViewController.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/05/07.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class TrackDetailViewController: UIViewController {
    
    
    private var presenter: TrackDetailPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func inject(presenter: TrackDetailPresenter){
        self.presenter = presenter
    }

    @IBAction func tapButton(_ sender: Any) {
        self.presenter?.goToNext()
    }
    

}
