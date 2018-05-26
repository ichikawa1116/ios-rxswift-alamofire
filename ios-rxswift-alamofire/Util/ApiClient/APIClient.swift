//
//  ApiClient.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/25.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Reachability

final class APIClient {
    
    let reachability = Reachability()!
    
    func request(router: Router) -> Observable<Any> {
        return Observable.create { observer in
            
            if NetworkManager.isNetworkConnected() {
                Alamofire.request(router).responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                    case .failure:
                        if let _ = response.result.error {
                            let observeError = self.createObserverError()
                            observer.onError(observeError)
                        } else {
                            fatalError("エラーのインスタンスがnil")
                        }
                        observer.onCompleted()
                    }
                }
            }else {
                let observeError = self.createObserverError()
                observer.onError(observeError)
            }
            return Disposables.create {  }
        }
    }
    
    func createObserverError() -> ObserveError {
        return ObserveError(title: "", message: "", type: .noConnection)
    }

}

