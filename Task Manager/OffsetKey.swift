//
//  OffsetKey.swift
//  TaskManager
//
//  Created by Bera Bekir Baykal on 29.04.2024.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
