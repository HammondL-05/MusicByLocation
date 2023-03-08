//
//  String.swift
//  MusicByLocation
//
//  Created by Leo Hammond on 07/03/2023.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
