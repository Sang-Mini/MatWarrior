//
//  PlaceViewModel.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/03.
//

import Foundation
import UIKit

class PlaceViewModel {
    var places: [Place] = []
    
    init() {
        places = [
            Place(name: "KBJJF 일산오픈 주짓수 대회", address: "경기 고양시 일산서구 킨텍스로 217-59 (일산 킨텍스 제 2전시장 7B홀)", latitude: 37.665077, longitude: 126.741956, date: "2023-11-04 (토)", deadlineApplications: "2023-10-31 (화)", image: UIImage(named: "KBJJF 일산오픈 주짓수 대회")!),
            Place(name: "예거스컵 송도", address: "송도 컨벤시아 (인천 연수구 센트럴로 123 송도컨벤시아)", latitude: 37.388723, longitude: 126.646716, date: "2023-11-04 (토)", deadlineApplications: "2023-10-29 (일)", image: UIImage(named: "예거스컵 송도")!),
            Place(name: "나르샤 주짓수 챔피언십", address: "경기도 부천시 상동 뉴코아아울렛", latitude: 37.504702, longitude: 126.756979, date: "2023-11-11 (토)", deadlineApplications: "2023-11-05 (일)", image: UIImage(named: "나르샤 주짓수 챔피언십")!),
            Place(name: "2023 KBJJF 부산오픈", address: "부산 해운대구 APEC로 55 (벡스코)", latitude: 35.168655, longitude: 129.135821, date: "2023-11-11 (토)", deadlineApplications: "2023-11-05 (일)", image: UIImage(named: "2023 KBJJF 부산오픈")!),
            Place(name: "스트릿 주짓수 40 서울 오픈", address: "서울 강남구 남부순환로 3104 (SETEC 2 전시장)", latitude: 37.495712, longitude: 127.071828, date: "2023-11-12 (일)", deadlineApplications: "2023-11-03 (금)", image: UIImage(named: "스트릿 주짓수 40 서울 오픈")!),
            Place(name: "O LIGA DE COMBATE 001 [오 리가 001]", address: "서울 구로구 구로동 3-33 (신도림오페라하우스 지하소극장)", latitude: 37.508071, longitude: 126.890966, date: "2023-11-25 (토)", deadlineApplications: "2023-11-25 (금)", image: UIImage(named: "O LIGA DE COMBATE 1")!),
            Place(name: "2023년 인천시 주짓수 대회", address: "인천 부평구 동수로 66 인천부평남부체육센터", latitude: 37.481962, longitude: 126.726177, date: "2023-11-25 (토)", deadlineApplications: "2023-11-15 (수)", image: UIImage(named: "2023년 인천시 주짓수 대회")!),
            Place(name: "목포시장기 전국주짓수대회", address: "전남 목포시 해양대학로 91 (목포해양대학교 체육관)", latitude: 37.792388, longitude: 126.365249, date: "2023-11-25 (토)", deadlineApplications: "2023-11-18 (토)", image: UIImage(named: "목포시장기 전국주짓수대회")!),
            Place(name: "제1회 히간마차도배 전국주짓수 챔피언쉽", address: "경기 광주시 회안대로 891 (경기광주문화스포츠센터)", latitude: 37.426767, longitude: 127.254436, date: "2023-11-26 (일)", deadlineApplications: "2023-11-15 (수)", image: UIImage(named: "제1회 히간마차도배 전국주짓수 챔피언쉽")!),
            Place(name: "EL Sports Jiu Jitsu", address: "충남 천안시 동남구 상명대길 31 상명대학교 천안캠퍼스 체육관", latitude: 36.833227, longitude: 127.179179, date: "2023-12-02 (토)", deadlineApplications: "2023-11-23 (목)", image: UIImage(named: "EL Sports Jiu Jitsu")!),
            Place(name: "19회 리얼주짓수 전주 오픈", address: "전주 화산 체육관", latitude: 35.820868, longitude: 127.124771, date: "2023-12-02 (토)", deadlineApplications: "2023-11-24 (금)", image: UIImage(named: "19회 리얼주짓수 전주 오픈")!),
            Place(name: "나르샤 주짓수 챔피언십 부천", address: "경기 부천시 팀엑슬 주짓수", latitude: 37.501171, longitude: 126.774678, date: "2023-12-02 (토)", deadlineApplications: "2023-11-26 (일)", image: UIImage(named: "나르샤 주짓수 챔피언십 부천")!),
            Place(name: "제 15회 부산오픈 주짓수 챔피언쉽 대회", address: "부산 북구 사랑로 132번길 88 (부산과학기술대학교 실내체육관)", latitude: 35.194692, longitude: 129.004218, date: "2023-12-03 (일)", deadlineApplications: "2023-11-25 (토)", image: UIImage(named: "제 15회 부산오픈 주짓수 챔피언쉽 대회")!),
            Place(name: "나르샤 주짓수 챔피언십 대전", address: "대전 대죽체육관 (이문고등학교)", latitude: 36.448007, longitude: 127.422486, date: "2023-12-09 (토)", deadlineApplications: "2023-12-03 (일)", image: UIImage(named: "나르샤 주짓수 챔피언십 대전")!),
            Place(name: "아디다스 주짓수컵 김해", address: "경남 김해 공설운동장 체육관(업데이트 예정)", latitude: 35.269614, longitude: 128.844084, date: "2023-12-09 (토)", deadlineApplications: "업데이트 예정", image: UIImage(named: "아디다스 주짓수컵 김해")!),
            Place(name: "2023 구리시 주짓수대회2", address: "경기도 구리시 체육관로 131 (구리시 시립체육관)", latitude: 37.595943, longitude: 127.136288, date: "2023-12-09 (토)", deadlineApplications: "2023-12-02 (토)", image: UIImage(named: "2023 구리시 주짓수대회2")!),
            Place(name: "리그로얄 부산", address: "부산광역시 강서구 대저1동 2158 (부산 강서체육관)", latitude: 35.209911, longitude: 128.971882, date: "2023-12-16 (토)", deadlineApplications: "2023-12-11 (월)", image: UIImage(named: "리그로얄 부산")!),
            Place(name: "제 2회 샤카주짓수 챔피언십", address: "경남 창원시 마산회원구 삼호로 64 마산종합운동장", latitude: 35.222004, longitude: 128.579550, date: "2023-12-16 (토)", deadlineApplications: "2023-12-08 (금)", image: UIImage(named: "제 2회 샤카주짓수 챔피언십")!),
            Place(name: "나르샤 주짓수 챔피언십 포항", address: "포항 종합운동장 실내체육관", latitude: 36.008629, longitude: 129.360957, date: "2023-12-16 (토)", deadlineApplications: "2023-12-10 (일)", image: UIImage(named: "나르샤 주짓수 챔피언십 포항")!),
            Place(name: "나르샤 주짓수 챔피언십 군산", address: "전북 군산시 번영로 281 (월명체육관)", latitude: 35.963679, longitude: 126.749177, date: "2023-12-30 (토)", deadlineApplications: "2023-12-24 (일)", image: UIImage(named: "나르샤 주짓수 챔피언십 군산")!),
        ]
    }
    
    func getPlaces() -> [Place] {
        return places
    }
    
    func getSortedPlaces() -> [Place] {
        return places.sorted { $0.dateObject ?? Date() < $1.dateObject ?? Date() }
    }
}
