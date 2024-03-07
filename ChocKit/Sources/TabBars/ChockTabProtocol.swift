//
//  File.swift
//  ChocKit
//
//  Created by Alex Vaiman on 07/03/2024.
//

import Foundation

/// *tagID must be unique string, each tub must have different
/// **important!! same!! tag should be given to the screen witch belongs to the tab, doing so by calling .chockBarItem(tagID)

public protocol ChockTabProtocol {
    var tagID: String { get }
}
