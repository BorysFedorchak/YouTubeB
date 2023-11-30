//
//  SubscriptionItemType.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

enum SubscriptionItemType {
    case channel(SubscriptionChannelCellInfo)
    case explore(SubscriptionExploreCellInfo)
    case videoPost(SubscriptionVideoPostItemInfo)
}
