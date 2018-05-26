//
//  TrackDetailRouter.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/05/08.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import UIKit

protocol TrackDetailRouter {
    func goToNext()
}

class TrackDetailRouterImpl: TrackDetailRouter {
    
    private weak var vc: TrackDetailViewController?
    
    init(_ viewController: TrackDetailViewController) {
        vc = viewController
    }
    
    func goToNext() {
        //vc?.navigationController?.pushViewController(ThirdBuilder.build(), animated: true)
    }
}
