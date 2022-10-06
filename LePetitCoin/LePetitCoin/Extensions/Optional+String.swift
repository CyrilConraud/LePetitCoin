//
//  Optional+String.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 05/10/2022.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return ""
        }
    }
}
