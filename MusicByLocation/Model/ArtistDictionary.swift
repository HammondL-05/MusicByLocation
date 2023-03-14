////
////  StringDictionary.swift
////  MusicByLocation
////
////  Created by Leo Hammond on 09/03/2023.
////
//
//import Foundation
//
//struct ArtistDictionary<Key: Hashable>: Hashable, Equatable {
//    private var dictionary: [Key: [StringTuple]] = [:]
//
//    mutating func appendKey(_ key: Key, value: StringTuple) {
//        if let existingValues = dictionary[key] {
//            dictionary[key] = existingValues + [value]
//        } else {
//            dictionary[key] = [value]
//        }
//    }
//
//    mutating func appendToKey(_ key: Key, value: String) {
//        if var existingValues = dictionary[key] {
//            let tuple = StringTuple(value, "")
//            if let index = existingValues.firstIndex(of: tuple) {
//                var tuple = existingValues[index]
//                tuple.second = value
//                existingValues[index] = tuple
//                dictionary[key] = existingValues
//            } else {
//                existingValues.append(StringTuple(value, ""))
//                dictionary[key] = existingValues
//            }
//        }
//    }
//
//
//    static func == (lhs: ArtistDictionary<Key>, rhs: ArtistDictionary<Key>) -> Bool {
//        return lhs.dictionary == rhs.dictionary
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.dictionary)
//    }
//}
//
//
