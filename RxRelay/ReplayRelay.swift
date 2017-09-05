//
//  ReplayRelay.swift
//  RxRelay
//
//  Created by Wassim Seifeddine on 3/31/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import Foundation
import RxSwift


public final class ReplayRelay<T>: ObservableConvertibleType {
    
    private let subject : ReplaySubject<T>
    
    
    public init(withBufferSize bfsize: Int){
        subject = ReplaySubject<T>.create(bufferSize: bfsize)
    }
    
    public func subsribe(On on :  ((T) -> Void)?  ) -> Disposable{
        return subject.asObservable().subscribe(onNext: on)
    }
    
    public func accept(_ element: T) {
        subject.onNext(element)
    }
    
    public func asObservable() -> Observable<T> {
        return subject.asObservable()
    }
}
