//
//  SubscriptionChannelSetCell.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import SnapKit
import UIKit

class SubscriptionChannelSetCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: SubscriptionChannelCellInfo) {
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
        static let collectionViewHeight: CGFloat = 120
        static let cellWidth: CGFloat = 65
        static let cellHeight: CGFloat = 95
    }
    
    //MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: SubscriptionChannelCellInfo = []
    
}
//MARK: - Private methods
private extension SubscriptionChannelSetCell {
    func initializeSubscription() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.register(SubscriptionChannelItemCell.self, forCellWithReuseIdentifier: String(describing: SubscriptionChannelItemCell.self))
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
extension SubscriptionChannelSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SubscriptionChannelItemCell.self), for: indexPath) as? SubscriptionChannelItemCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SubscriptionChannelSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
    
}

