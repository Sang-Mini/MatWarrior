//
//  TournamentViewController.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/13.
//

import UIKit

class TournamentViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 대회 정보를 표시하는 UI를 추가
        let label = UILabel()
        label.text = "대회 정보 화면"
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 30)
        view.addSubview(label)
    }
    
    // 몇 개의 테이블을 생성할 건지 구현하는 필수 구현 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
