//
//  SubscriptionEploreItemCell.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import SnapKit
import UIKit

class SubscriptionExploreItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with info: SubscriptionExploreItemCellInfo) {
        exploreLabel.text = info.exploreName
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubscription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private constants
    private enum UIConstants {
        static let exploreLabel: CGFloat = 6
        static let labelSize: CGFloat = 30
        static let exploreNameFontSize: CGFloat = 12
    }
    
    //MARK: Private properties
    private let exploreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.layer.cornerRadius = UIConstants.labelSize / 3
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: UIConstants.exploreNameFontSize)
        return label
    }()
}
 //MARK: Private methods
private extension SubscriptionExploreItemCell {
    func initializeSubscription() {
        contentView.addSubview(exploreLabel)
        exploreLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(UIConstants.exploreLabel)
            make.top.equalToSuperview().inset(UIConstants.exploreLabel)
            make.height.equalTo(UIConstants.labelSize)
            
        }
    }
}
