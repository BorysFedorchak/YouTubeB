//
//  LogoView.swift
//  YouTubeB
//
//  Created by borys on 30.11.2023.
//

import SnapKit
import UIKit

class LogoView: UIView {
    // MARK: - Init
    init(){
        super .init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private constants
    private enum UiConstants{
        static let logoWidth: CGFloat = 90
        static let logoHeight: CGFloat = 27
    }
    
    // MARK: Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Logo")
        return view
    }()
    
}
// MARK: - Private methods
private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UiConstants.logoWidth)
            make.height.equalTo(UiConstants.logoHeight)
            
        }
    }
}
