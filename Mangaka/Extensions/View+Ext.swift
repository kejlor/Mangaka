//
//  View+Ext.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
