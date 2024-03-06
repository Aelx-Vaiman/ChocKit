//
//  TabBarItem.swift
//  
//
//  Created by Nick Sarno on 4/8/22.
//

import Foundation
import SwiftUI

public struct ChockBarItem: Hashable {
    public let title: String
    public let var image: Image
    
    private var badgeCount: Int?
    // used for hash.
    private let resourceName: String
    
    public var currentBadgeCount: Int? {
        badgeCount 
    }
    
    
    public init(title: String?, resource: String, badgeCount: Int? = nil) {
        self.resourceName = resource
        self.title = title
        self.image = Image(resource)
        self.badgeCount = badgeCount
    }
    
    public init(title: String?, systemName: String = "", badgeCount: Int? = nil) {
        self.resourceName = systemName
        self.title = title
        self.image = Image(systemName: systemName)
        self.badgeCount = badgeCount
    }
    
    public mutating func updateBadgeCount(to count: Int) {
        badgeCount = count
    }
    
    // "is equal" for selected tab, this function must ignore badgeCount, due to inner implementation!
    // when ever you need to check is the selected tab equal to other tab you must use this function!
    public func isSame(other: ChockBarItem) -> Bool {
        return title == other.title
        && resourceName == other.resourceName
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(resourceName)
        hasher.combine(badgeCount)
    }
}
