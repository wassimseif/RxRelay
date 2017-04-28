//
//  PublishRelay.swift
//  RxRelay
//
//  Created by Wassim Seifeddine on 3/31/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class PublishRelay<T>: ObservableConvertibleType {
    
    private let subject : PublishSubject<T>
    
    init(){
        subject = PublishSubject<T>()
    }
    
    func subsribe(On on :  ((T) -> Void)?  ){
       _ =  subject.asObservable().subscribe(onNext: on)
    }
    
    func accept(_ element: T) {
        subject.onNext(element)
    }
    
    func asObservable() -> Observable<T> {
        return subject.asObservable()
    }
}
