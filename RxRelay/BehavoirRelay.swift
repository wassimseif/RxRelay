//
//  BehavoirRelay.swift
//  RxRelay
//
//  Created by Wassim Seifeddine on 3/31/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public final class BehavoirRelay<T>: ObservableConvertibleType {
    
    private let subject : BehaviorSubject<T>
    
    
    public init(defaultValue defaultvalue : T){
        subject = BehaviorSubject<T>(value: defaultvalue)
    }
    
    public func subsribe(On on :  ((T) -> Void)?  ){
        _ =  subject.asObservable().subscribe(onNext: on)
    }
    
    public func accept(_ element: T) {
        subject.onNext(element)
    }
    
   public  func asObservable() -> Observable<T> {
        return subject.asObservable()
    }
}
