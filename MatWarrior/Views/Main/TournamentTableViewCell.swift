//
//  TournamentTableViewCell.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/15.
//

import UIKit

class TournamentTableViewCell: UITableViewCell {
    let tournamentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 이미지 뷰
        addSubview(tournamentImageView)
        NSLayoutConstraint.activate([
            tournamentImageView.topAnchor.constraint(equalTo: topAnchor),
            tournamentImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tournamentImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tournamentImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // 대회 이름 레이블
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: tournamentImageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        // 대회 날짜 레이블
        addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with place: Place) {
//        tournamentImageView.image = UIImage(named: place.imageName)
        nameLabel.text = place.name
        dateLabel.text = "날짜: \(place.date)"
    }
}
