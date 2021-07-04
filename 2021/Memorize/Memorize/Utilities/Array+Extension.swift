//
//  Array+Extension.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/07/05.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        }
        else {
            return nil
        }
    }
}
