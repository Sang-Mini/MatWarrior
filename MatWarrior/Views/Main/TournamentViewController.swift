//
//  TournamentViewController.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/13.
//

import UIKit

class TournamentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var placeViewModel = PlaceViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dataSource 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 테이블 뷰 cell 높이를 설정
        tableView.rowHeight = 180
    }
    
    // 몇 개의 테이블을 생성할 건지 구현하는 필수 구현 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeViewModel.getSortedPlaces().count
    }
    
    // 테이블 뷰 cell을 그리는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableViewCell 타입을 TournamentTableViewCell 타입으로 타입캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "TournamentCell", for: indexPath) as! TournamentTableViewCell
        
        let place = placeViewModel.getSortedPlaces()[indexPath.row]
        cell.configure(with: place)
        
        // 탭 했을때 스타일 제거
        cell.selectionStyle = .none
        // 밑줄 제거
        tableView.separatorStyle = .none
        // 대회 이름 굵게 철
        cell.tournamentNameLabel.font = UIFont.boldSystemFont(ofSize: 21.0) // 적절한 폰트 크기 사용
        
        return cell
    }
     
    // Cell 선택 시 화면 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 대회 정보 가져오기
        let selectedPlace = placeViewModel.getSortedPlaces()[indexPath.row]
        
        // 대회 장소 화면으로 이동
        if let placeViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            placeViewController.selectedPlace = selectedPlace
            
            // 탭 바 컨트롤러에서 대회 장소 탭을 선택
            tabBarController?.selectedIndex = 1
            
            // 대회 장소 화면으로 변경
            navigationController?.setViewControllers([placeViewController], animated: true)
        }
    }
}
