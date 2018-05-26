//
//  APIRequest.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/25.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

final class ArtistSearchAPI {
        
    let disposeBag = DisposeBag()
    
    func fetch(artist: String) -> Observable<Results> {
        
        return Observable<Results>.create({ (observer) -> Disposable in
            let router = Router.trackSearch(
                RestSearchParamsBuilder.create(artist: artist)
            )
            APIClient().request(router: router)
                .subscribe(onNext: {(element) in
                    if let result = Mapper<Results>().map(JSONObject: element){
                        observer.onNext(result)
                    }else {
                        observer.onCompleted()
                    }
                },onError:{ (error) in
                    observer.onError(error)
                })
                .disposed(by: self.disposeBag)
            
            return Disposables.create(with: {
            })
            
        })
    }
    
}
