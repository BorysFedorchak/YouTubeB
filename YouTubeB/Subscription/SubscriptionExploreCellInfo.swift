//
//  SubscriptionExploreCellInfo.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import Foundation
import UIKit

struct SubscriptionExploreItemCellInfo {
    let exploreName: String
    var title: String
    var font: UIFont = UIFont.systemFont(ofSize: 14)
}

typealias SubscriptionExploreCellInfo = [SubscriptionExploreItemCellInfo]
