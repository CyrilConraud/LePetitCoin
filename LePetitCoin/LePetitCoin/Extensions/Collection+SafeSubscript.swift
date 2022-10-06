//
//  Collection+SafeSubscript.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 04/10/2022.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
