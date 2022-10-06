//
//  URL+LePetitCoin.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 04/10/2022.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        self.init(string: "\(value)")!
    }
}
