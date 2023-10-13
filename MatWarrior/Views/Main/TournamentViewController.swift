//
//  TournamentViewController.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/13.
//

import UIKit

class TournamentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // 대회 정보를 표시하는 UI를 추가
        let label = UILabel()
        label.text = "대회 정보 화면"
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 30)
        view.addSubview(label)
    }
}
