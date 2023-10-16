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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(wirh place: Place) {
        tournamentImageView.image = UIImage(named: "MarWarriorMarker")
        tournamentNameLabel.text = place.name
        tournamentDateLabel.text = place.date
    }

}
