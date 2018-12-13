//
//  UniqueElementsExtension.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 12/13/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation

public extension Sequence where Element: Equatable {
    var uniqueElements: [Element] {
        return reduce(into: []) {
            uniqueElements, element in

            if !uniqueElements.contains(element) {
                uniqueElements.append(element)
            }
        }
    }
}
