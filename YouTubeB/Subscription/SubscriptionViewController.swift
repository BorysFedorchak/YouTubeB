//
//  SubscriptionViewController.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import UIKit
import SnapKit

class SubscriptionVC : UIViewController {
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSubscription()
    }
    //MARK: Private properties
    private let tableView = UITableView()
    private let items: [SubscriptionItemType] = [
        .channel([
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube", isNewVideo: true),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "You", isNewVideo: false),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube35212", isNewVideo: false),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube", isNewVideo: true),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube", isNewVideo: true),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube", isNewVideo: true),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube", isNewVideo: true),
            SubscriptionChannelItemCellInfo(channelImage: UIImage(named: "userImage")!, channelName: "YouTube", isNewVideo: false)
        ]),
        .explore([
            SubscriptionExploreItemCellInfo(exploreName: "Усі", title: "Усі"),
            SubscriptionExploreItemCellInfo(exploreName: "За сьогодні", title: "За сьогодні"),
            SubscriptionExploreItemCellInfo(exploreName: "Пряма трансляція", title: "Пряма трансляція"),
            SubscriptionExploreItemCellInfo(exploreName: "Короткі відео", title: "Короткі відео"),
            SubscriptionExploreItemCellInfo(exploreName: "Продовжити перегляд", title: "Продовжити перегляд"),
            SubscriptionExploreItemCellInfo(exploreName: "Непереглянуті", title: "Непереглянуті"),
            SubscriptionExploreItemCellInfo(exploreName: "Дописи", title: "Дописи"),
        ]),
        .videoPost(SubscriptionVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48")),
        .videoPost(SubscriptionVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48")),
        .videoPost(SubscriptionVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48")),
        .videoPost(SubscriptionVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48"))
    ]
}
// MARK: - Private methods
private extension SubscriptionVC {
    func initializeSubscription(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(SubscriptionChannelSetCell.self, forCellReuseIdentifier: String(describing: SubscriptionChannelSetCell.self))
        tableView.register(SubscriptionExploreSetCell.self, forCellReuseIdentifier: String(describing: SubscriptionExploreSetCell.self))
        tableView.register(SubscriptionVideoPostCell.self, forCellReuseIdentifier: String(describing: SubscriptionVideoPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        return [logoBarButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let tvBarButtonItem = UIBarButtonItem(image: UIImage(named: "Cast"), style: .plain, target: self, action: #selector(didTapTvButton))
        
        let notificationsBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(didTapNotificationsButton))
        
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(didTapSearchButton))
        
        return [searchBarButtonItem, notificationsBarButtonItem, tvBarButtonItem]
    }
    
    @objc func didTapTvButton() {
        
    }
    @objc func didTapNotificationsButton() {
        
    }
    @objc func didTapSearchButton() {
        
    }
}
//MARK: - UITableViewDataSource
extension SubscriptionVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item {
            
        case .channel(let channel):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubscriptionChannelSetCell.self), for: indexPath) as? SubscriptionChannelSetCell {
                cell.configure(with: channel)
                return cell
            }
        case .explore(let info):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubscriptionExploreSetCell.self), for: indexPath) as? SubscriptionExploreSetCell {
                cell.configure(with: info)
                return cell
            }
            
        case .videoPost(let videoPost):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubscriptionVideoPostCell.self), for: indexPath) as? SubscriptionVideoPostCell {
                cell.configure(with: videoPost)
                return cell
            }
        }
        return UITableViewCell()

    }
}
