//
//  TrackListBuilder.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/05/12.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

struct TrackListBuilder {
    
    static func build() -> TrackListViewController {
        
        let viewController = TrackListViewController()
        let router = TrackListRouterImpl(viewController)
        let presenter = TrackListPresenterImpl(router: router)
        viewController.inject(presenter: presenter)
        
        return viewController
        
    }
}

