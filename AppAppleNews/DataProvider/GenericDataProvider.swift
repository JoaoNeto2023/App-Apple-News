//
//  GenericDataProvider.swift
//  AppAppleNews
//
//  Created by João Neto  on 03/10/23.
//

import Foundation

protocol GenericDataProvider {
    func success(model: Any)
    func errorData(_ provide: GenericDataProvider?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
