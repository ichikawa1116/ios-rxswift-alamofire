//
//  TrackListRouter.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/05/08.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import UIKit

protocol TrackListRouter {
    func goToNext()
}

class TrackListRouterImpl: TrackListRouter {
    
    private weak var vc: TrackListViewController?
    
    init(_ viewController: TrackListViewController) {
        vc = viewController
    }
    
    func goToNext() {
        vc?.navigationController?.pushViewController(TrackDetailBuilder.build(), animated: true)
    }
}

