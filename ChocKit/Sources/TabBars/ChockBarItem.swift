//
//  TabBarItem.swift
//  
//
//  Created by Nick Sarno on 4/8/22.
//

import Foundation
import UIKit

public struct ChockBarItem: Hashable {
    private(set) var title: String?
    private(set) var iconName: String?
    private(set) var image: UIImage?
    public(set) var badgeCount: Int?
    
    public init(title: String?, iconName: String? = nil, image: UIImage? = nil, badgeCount: Int? = nil) {
        self.title = title
        self.iconName = iconName
        self.image = image
        self.badgeCount = badgeCount
    }
    
    public mutating func updateBadgeCount(to count: Int) {
        badgeCount = count
    }
    
    // is equal for selected tab, must ignore badgeCount!
    internal func isSame(other: ChockBarItem) -> Bool {
        return title == other.title
        && iconName == other.iconName
        && image == other.image
    }
}
