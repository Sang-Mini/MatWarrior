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
        let desiredHeight: CGFloat = 215
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
            nameLabel.numberOfLines = 1  // 여러 줄 허용
            //            nameLabel.lineBreakMode = .byWordWrapping  // 단어 단위로 줄 바꿈
            nameLabel.adjustsFontSizeToFitWidth = true
            nameLabel.minimumScaleFactor = 0.5
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.font = UIFont.boldSystemFont(ofSize: nameLabel.font.pointSize)
            nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)  // 예시로 크기를 16으로 지정
            
            let dateLabel = UILabel()
            dateLabel.text = "대회 날짜 : \(place.date)"
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let deadlineApplicationsLabel = UILabel()
            deadlineApplicationsLabel.text = "신청 기간 : \(place.deadlineApplications)"
            deadlineApplicationsLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let addressLabel = UILabel()
            addressLabel.text = "대회 장소 : \(place.address)"
            addressLabel.numberOfLines = 0  // 여러 줄 허용
            addressLabel.lineBreakMode = .byWordWrapping  // 단어 단위로 줄 바꿈
            addressLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // 주소 복사 버튼 추가
            let copyAddressButton = UIButton()
            copyAddressButton.setTitle("주소 복사하기", for: .normal)
            copyAddressButton.setTitleColor(.blue, for: .normal)
            copyAddressButton.addTarget(self, action: #selector(copyAddress), for: .touchUpInside)
            copyAddressButton.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(nameLabel)
            view.addSubview(dateLabel)
            view.addSubview(addressLabel)
            view.addSubview(deadlineApplicationsLabel)
            view.addSubview(copyAddressButton)
            
            NSLayoutConstraint.activate([
                // 대회 이름
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // 오른쪽 여백
                // 대회 날짜
                dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),  // 오른쪽 여백
                // 신청 기간
                deadlineApplicationsLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
                deadlineApplicationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                deadlineApplicationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),  // 오른쪽 여백
                // 대회 장소
                addressLabel.topAnchor.constraint(equalTo: deadlineApplicationsLabel.bottomAnchor, constant: 10),
                addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),  // 오른쪽 여백
                // 주소 복사하기 버튼
                copyAddressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                copyAddressButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            ])
            
            // copyAddressButton 스타일 설정
            copyAddressButton.setTitleColor(.gray, for: .normal)
            copyAddressButton.titleLabel?.underline()
        }
    }
    
    // 주소 복사 기능
    @objc func copyAddress() {
        if let address = place?.address {
            // 주소를 클립보드에 복사
            UIPasteboard.general.string = address
            
            // 복사되었다는 알림을 사용자에게 보여줄 수도 있습니다.
            let alert = UIAlertController(title: "복사 완료", message: "주소가 클립보드에 복사되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
