//
//  HomeViewController.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import UIKit
import SnapKit

class HomeVC : UIViewController {
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    //MARK: Private properties
    private let tableView = UITableView()
    private let items: [HomeItemType] = [
        .explore([
            HomeExploreItemCellInfo(exploreName: "Усі", title: "Усі"),
            HomeExploreItemCellInfo(exploreName: "Ігри", title: "Ігри"),
            HomeExploreItemCellInfo(exploreName: "Скетч-Шоу", title: "Скетч-Шоу"),
            HomeExploreItemCellInfo(exploreName: "Новини", title: "Новини"),
            HomeExploreItemCellInfo(exploreName: "Пригодницький бойовик", title: "Пригодницький бойовик"),
            HomeExploreItemCellInfo(exploreName: "Нещодавні завантаження", title: "Нещодавні завантаження"),
            HomeExploreItemCellInfo(exploreName: "Новинки для вас", title: "Новинки для вас"),
        ]),
        .videoPost(HomeVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48")),
        .videoPost(HomeVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48")),
        .videoPost(HomeVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48")),
        .videoPost(HomeVideoPostItemInfo(videoPostImage: UIImage(named: "videoPostImage")!, userImage: UIImage(named: "userImage")!, videoPostName: "Build it in Figma: Create a Design System — Foundations", videoPostSubtitle: "Figma   44K views   4 months ago", videoPostTime: "54:48"))
    ]
}
// MARK: - Private methods
private extension HomeVC {
    func initialize(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(HomeExploreSetCell.self, forCellReuseIdentifier: String(describing: HomeExploreSetCell.self))
        tableView.register(HomeVideoPostCell.self, forCellReuseIdentifier: String(describing: HomeVideoPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
//        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem] // ,dropDownButtonItem
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
    
// Ідея зробити як у інстаграма
//    func makeDropDownMenu() -> UIMenu {
//        let chotoItem = UIAction(title: "Щось", image: UIImage(systemName: "person")) { _ in
//            print("Щось")
//        }
//        let chotoItem2 = UIAction(title: "Щось", image: UIImage(systemName: "person")) { _ in
//            print("Щось")
//        }
//        return UIMenu(title: "", children: [chotoItem, chotoItem2])
//    }
}
//MARK: - UITableViewDataSource
extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item {
        case .explore(let info):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeExploreSetCell.self), for: indexPath) as? HomeExploreSetCell {
                cell.configure(with: info)
                return cell
            }
            
        case .videoPost(let videoPost):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeVideoPostCell.self), for: indexPath) as? HomeVideoPostCell {
                cell.configure(with: videoPost)
                return cell
            }
        }
        return UITableViewCell()

    }
}
