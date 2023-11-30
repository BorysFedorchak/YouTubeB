//
//  SubscriptionChannelItemCell.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import SnapKit
import UIKit

class SubscriptionChannelItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with info: SubscriptionChannelItemCellInfo) {
        imageView.image = info.channelImage
        channelLabel.text = info.channelName
        ellipseImageView.isHidden = !info.isNewVideo
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
        static let imageSize: CGFloat = 65
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let channelNameFontSize: CGFloat = 12
        static let ellipseImageViewSize: CGFloat = 10
        static let contentInset: CGFloat = 12
    }
    
    //MARK: Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let channelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.channelNameFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let ellipseImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Ellipse")
        return view
    }()
}
 //MARK: Private methods
private extension SubscriptionChannelItemCell {
    func initializeSubscription() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview()
        }
        contentView.addSubview(channelLabel)
        channelLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        contentView.addSubview(ellipseImageView)
        ellipseImageView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.ellipseImageViewSize)
        }
        channelLabel.layoutIfNeeded()
    }
}
