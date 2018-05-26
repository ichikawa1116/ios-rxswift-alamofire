//
//  TrackDetailBuilder.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/05/07.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

struct TrackDetailBuilder {

    static func build() -> TrackDetailViewController {

        let viewController = TrackDetailViewController()
        let router = TrackDetailRouterImpl(viewController)
        let presenter = TrackDetailPresenterImpl(router: router)
        viewController.inject(presenter: presenter)

        return viewController

    }
}

