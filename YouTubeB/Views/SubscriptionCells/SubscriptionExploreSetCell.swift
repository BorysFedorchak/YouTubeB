//
//  SubscriptionExploreSetCell.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import SnapKit
import UIKit

class SubscriptionExploreSetCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: SubscriptionExploreCellInfo) {
        self.items = info
        collectionView.reloadData()
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        initializeSubscription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let collectionViewHeight: CGFloat = 50
        static let cellWidth: CGFloat = 50
        static let cellHeight: CGFloat = 35
    }
    
    //MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: SubscriptionExploreCellInfo = []
    
}
//MARK: - Private methods
private extension SubscriptionExploreSetCell {
    func initializeSubscription() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.register(SubscriptionExploreItemCell.self, forCellWithReuseIdentifier: String(describing: SubscriptionExploreItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
            
        }
    }
}

//MARK: - UICollectionViewDataSource
extension SubscriptionExploreSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SubscriptionExploreItemCell.self), for: indexPath) as? SubscriptionExploreItemCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SubscriptionExploreSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.item]
            let textWidth = item.title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)]).width
            let cellWidth = max(UIConstants.cellWidth, textWidth + 20)
            return CGSize(width: cellWidth, height: UIConstants.cellHeight)
    }
    
}
