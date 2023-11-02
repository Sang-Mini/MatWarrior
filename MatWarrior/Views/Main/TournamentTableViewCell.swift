//
//  TournamentTableViewCell.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/16.
//

import UIKit

class TournamentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tournamentImageView: UIImageView!
    @IBOutlet weak var tournamentNameLabel: UILabel!
    @IBOutlet weak var tournamentDateLabel: UILabel!
    @IBOutlet weak var tournamentDeadlineApplicationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // Cell 간 간격 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10.0, left: 16, bottom: 10, right: 16))
    }
    
    func configure(with place: Place) {
        tournamentImageView.image = place.image
        tournamentNameLabel.text = place.name
        tournamentDateLabel.text = "대회 날짜 : \(place.date)"
        tournamentDeadlineApplicationLabel.text = "신청 기간 : \(place.deadlineApplications) 까지"
    }
    
    private func setupUI() {
        // 테두리 추가
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 10.0 // 셀 모서리를 둥글게 만듦
        contentView.clipsToBounds = true
    }
    
}
