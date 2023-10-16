//
//  TournamentViewController.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/13.
//

import UIKit

class TournamentViewController: UIViewController, UITableViewDataSource {
    
    var placeViewModel = PlaceViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dataSource 대리자 설정
        tableView.dataSource = self
    }
    
    // 몇 개의 테이블을 생성할 건지 구현하는 필수 구현 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeViewModel.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableViewCell 타입을 TournamentTableViewCell 타입으로 타입캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "TournamentCell", for: indexPath) as! TournamentTableViewCell

        return cell
    }
}
