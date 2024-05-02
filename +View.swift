//
//  +View.swift
//  TaskManager
//
//  Created by Bera Bekir Baykal on 29.04.2024.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alingment: Alignment) -> some View {
        self.frame(maxWidth: .infinity,alignment: alingment)
    }
    
    func vSpacing(_ alingment: Alignment) -> some View {
        self.frame(maxHeight: .infinity,alignment: alingment)
    }
    
    // İki günün aynı olma durumunu kontrol etmek
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
