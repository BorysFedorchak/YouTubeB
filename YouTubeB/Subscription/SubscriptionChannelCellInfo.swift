//
//  SubscriptionChannelCellInfo.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import Foundation
import UIKit

struct SubscriptionChannelItemCellInfo {
    let channelImage: UIImage
    let channelName: String
    let isNewVideo: Bool
}

typealias SubscriptionChannelCellInfo = [SubscriptionChannelItemCellInfo]
