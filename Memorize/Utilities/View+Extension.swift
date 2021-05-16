//
//  View+Extension.swift
//  Memorize
//
//  Created by HENRY YOO on 2021/05/16.
//

import SwiftUI

// MARK: - Debuggable

extension View {
    func debugAction(_ action: () -> Void) -> Self {
        #if DEBUG
        action()
        #endif

        return self
    }

    func debugPrint(_ value: Any) -> Self {
        debugAction { print(value) }
    }
}
