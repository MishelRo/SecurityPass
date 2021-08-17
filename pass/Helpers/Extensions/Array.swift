//
//  Array.swift
//  pass
//
//  Created by User on 17.08.2021.
//

import Foundation
extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
