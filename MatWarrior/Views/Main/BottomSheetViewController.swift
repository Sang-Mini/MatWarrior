//
//  BottomSheetViewController.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/03.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    var place: Place?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = UIColor.white.withAlphaComponent(0.8) // 0.7는 투명도를 나타냅니다.
        
        // 원하는 크기로 설정
        let desiredHeight: CGFloat = 200
        let desiredWidth: CGFloat = 350
        
        // 바텀 시트뷰의 높이를 조절
        let xPosition = (UIScreen.main.bounds.width - desiredWidth) / 2
        view.frame = CGRect(x: xPosition, y: UIScreen.main.bounds.height - desiredHeight, width: desiredWidth, height: desiredHeight)
        
        // 아래 영역을 자르기
        view.clipsToBounds = true
        
        // 모서리를 둥글게 설정
        view.layer.cornerRadius = 20
        
        if let place = place {
            let nameLabel = UILabel()
            nameLabel.text = place.name
            nameLabel.numberOfLines = 0  // 여러 줄 허용
            nameLabel.lineBreakMode = .byWordWrapping  // 단어 단위로 줄 바꿈
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.font = UIFont.boldSystemFont(ofSize: nameLabel.font.pointSize)
            nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)  // 예시로 크기를 16으로 지정
            
            let addressLabel = UILabel()
            addressLabel.text = place.address
            addressLabel.numberOfLines = 0  // 여러 줄 허용
            addressLabel.lineBreakMode = .byWordWrapping  // 단어 단위로 줄 바꿈
            addressLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let dateLabel = UILabel()
            dateLabel.text = place.date
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(nameLabel)
            view.addSubview(addressLabel)
            view.addSubview(dateLabel)
            
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // 오른쪽 여백
                addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),  // 오른쪽 여백
                dateLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
                dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)  // 오른쪽 여백
                
            ])
        }
    }
}
