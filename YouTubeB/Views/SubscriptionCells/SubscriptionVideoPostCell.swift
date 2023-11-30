//
//  SubscriptionVideoPostCell.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import SnapKit
import UIKit

class SubscriptionVideoPostCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: SubscriptionVideoPostItemInfo) {
        userImageView.image = info.userImage
        videoPostName.text = info.videoPostName
        videoPostSubtitle.text = info.videoPostSubtitle
        videoPostImageView.image = info.videoPostImage
        videoPostTimeLabel.text = info.videoPostTime
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
        static let contentInset: CGFloat = 12
        static let userImageToVideoPostImageOffset: CGFloat = 15
        static let userImageSize: CGFloat = 36
        static let videoPostNameFontSize: CGFloat = 20
        static let videoPostSubtitleFontSize: CGFloat = 12
        static let videoPostNameStackToProfileImageOffset: CGFloat = 5
        static let videoPostNameStackToOptionsButtonOffset: CGFloat = -24
        static let videoPostImageTopInset: CGFloat = 5
        static let videoPostImageHeight: CGFloat = 200
        static let videoPostNameStackToProfileImageYOffset: CGFloat = 15
        static let videoPostTimeLabelFontSize: CGFloat = 12
        static let videoPostTimeLabelWidth: CGFloat = 35
        static let videoPostTimeLabelHeight: CGFloat = 15
        static let videoPostTimeLabelToVideoPostImageInset: CGFloat = 15
    }
    
    
    //MARK: - Private properties
    private let videoPostImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 5
        view.clipsToBounds = true
        return view
    }()
    
    private let videoPostTimeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .systemFont(ofSize: UIConstants.videoPostTimeLabelFontSize)
        return label
    }()
    
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let videoPostName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: UIConstants.videoPostNameFontSize)
        return label
    }()
    
    private let videoPostSubtitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.videoPostSubtitleFontSize)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ellipsisvertical"), for: .normal)
        button.tintColor = .black
        return button
    }()
}

//MARK: - Private methods
private extension SubscriptionVideoPostCell {
    func initializeSubscription() {
        selectionStyle = .none
        
        contentView.addSubview(videoPostImageView)
        videoPostImageView.contentMode = .scaleAspectFill
        videoPostImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.videoPostImageTopInset)
            make.height.equalTo(UIConstants.videoPostImageHeight)
        }
        
        contentView.addSubview(videoPostTimeLabel)
        videoPostTimeLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(videoPostImageView).inset(UIConstants.videoPostTimeLabelToVideoPostImageInset)
            make.width.equalTo(UIConstants.videoPostTimeLabelWidth)
            make.height.equalTo(UIConstants.videoPostTimeLabelHeight)
        }
        
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(videoPostImageView.snp.bottom).offset(UIConstants.userImageToVideoPostImageOffset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        
        let videoPostNameStack = UIStackView()
        videoPostNameStack.axis = .vertical
        videoPostNameStack.addArrangedSubview(videoPostName)
        videoPostNameStack.addArrangedSubview(videoPostSubtitle)
        contentView.addSubview(videoPostNameStack)
        contentView.addSubview(optionsButton)
        videoPostNameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView).offset(UIConstants.videoPostNameStackToProfileImageYOffset)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.videoPostNameStackToProfileImageOffset)
            make.trailing.lessThanOrEqualTo(optionsButton.snp.leading).offset(UIConstants.videoPostNameStackToOptionsButtonOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        optionsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(userImageView)
        }
    }
}
