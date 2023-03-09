//
//  (String, String).swift
//  MusicByLocation
//
//  Created by Leo Hammond on 08/03/2023.
//

import Foundation

struct StringTuple: Hashable, Equatable, Identifiable {
    let id = UUID()
    let value: (String, String)
    var first: String
    var second: String
    
    init(_ first: String, _ second: String) {
        self.first = first
        self.second = second
        self.value = (first, second)
    }
    
    func getFirst() -> String {
        return value.0
    }
    
    func getSecond() -> String {
        return value.1
    }
    
    static func ==(lhs: StringTuple, rhs: StringTuple) -> Bool {
            return lhs.value == rhs.value
        }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.first)
        hasher.combine(self.second)
    }
}



