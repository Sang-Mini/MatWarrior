//
//  PlaceViewModel.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/03.
//

import Foundation

class PlaceViewModel {
    var places: [Place] = []
    
    init() {
        places = [
            Place(name: "알랙산더 파이바 컵", address: "경남 김해시 가야로 245 (김해시 공설운동장 실내체육관)", latitude: 35.255704, longitude: 128.875160, date: "2023-10-14 (토)", deadlineApplications: "2023-10-06 (금)"),
            Place(name: "신흥무관학교 전국무예대축전", address: "서울 종로구 세종대로 175 세종이야기 광화문광장 행사장(세종대왕동상앞)", latitude: 37.572639, longitude: 126.976726, date: "2023-10-14 (토)", deadlineApplications: "2023-09-30 (토)"),
            Place(name: "창원OPEN 유니온FG주짓수리그", address: "경남 창원시 마산회원구 삼호로 63 마산종합운동장 (마산실내체육관)", latitude: 35.222038, longitude: 128.579651, date: "2023-10-14 (토)", deadlineApplications: "2023-10-06 (금)"),
            Place(name: "2023 KBJJF 서울 오픈", address: "서울특별시 성북구 화랑로13길 144 (성북구민체육관)", latitude: 37.608522, longitude: 127.042282, date: "2023-10-15 (일)", deadlineApplications: "2023-10-10 (화)"),
            Place(name: "PROVA 16 인천 (부평남부체육센터) - 부평구협회장배", address: "인천 부평구 부평동 663-30 (부평남부체육센터)", latitude: 37.481997, longitude: 126.726188, date: "2023-10-21 (토)", deadlineApplications: "2023-10-14 (토)"),
            Place(name: "IRLS CHAMPIONSHIP in 수원", address: "경기 수원시 영통구 월드컵로 206 아주대학교 체육관", latitude: 37.279852, longitude: 127.045478, date: "2023-10-22 (일)", deadlineApplications: "2023-10-14 (토)"),
            Place(name: "제7회 대전서구청장배 주짓수대회", address: "대전 서구 배재로197번길 41 (도솔다목적 체육관)", latitude: 36.324610, longitude: 127.367923, date: "2023-10-22 (일)", deadlineApplications: "2023-10-14 (토)"),
            Place(name: "예거스컵 송도", address: "송도 컨벤시아 (인천 연수구 센트럴로 123 송도컨벤시아)", latitude: 37.388724, longitude: 126.646607, date: "2023-11-04 (토)", deadlineApplications: "2023-10-29 (일)"),
            Place(name: "2023 IDEA KOREA 주짓수 대회", address: "경기 고양시 일산서구 킨텍스로 217-60 (일산 킨텍스)", latitude: 37.669105, longitude: 126.745403, date: "2023-11-04 (토)", deadlineApplications: "2023-10-29 (일)"),
            Place(name: "나르샤 주짓수 챔피언십", address: "경기도 부천시 소사로 소사국민체육센터", latitude: 37.468450, longitude: 126.798398, date: "2023-11-11 (토)", deadlineApplications: "2023-11-05 (일)"),
            Place(name: "스트릿 주짓수 40 서울 오픈", address: "서울 강남구 남부순환로 3104 (SETEC 2 전시장)", latitude: 37.495755, longitude: 127.071849, date: "2023-11-12 (일)", deadlineApplications: "2023-11-03 (금)"),
            Place(name: "O LIGA DE COMBATE 001 [오 리가 001]", address: "서울 구로구 구로동 3-33 (신도림오페라하우스 지하소극장)", latitude: 37.508138, longitude: 126.891019, date: "2023-11-25 (토)", deadlineApplications: "2023-11-24 (금)"),
            Place(name: "2023년 인천시 주짓수 대회", address: "인천 부평구 동수로 66 인천부평남부체육센터", latitude: 37.482056, longitude: 126.726220, date: "2023-11-25 (토)", deadlineApplications: "2023-11-15 (수)"),
            Place(name: "나르샤 주짓수 챔피언십 부평", address: "인천광역시 부평구(장소 미정)", latitude: 37.4968, longitude: 126.7212, date: "2023-12-02 (토)", deadlineApplications: "2023-11-26 (일)"),
            Place(name: "리그로얄 부산 - 강서체육관#2", address: "부산 강서구 체육공원로 43 (강서체육관)", latitude: 35.210131, longitude: 128.972184, date: "2023-12-16 (토)", deadlineApplications: "업데이트 예정"),
            Place(name: "나르샤 주짓수 챔피언십 포항", address: "포항 종합운동장 실내체육관", latitude: 36.008555, longitude: 129.360848, date: "2023-12-16 (토)", deadlineApplications: "2023-12-10 (일)"),
        ]
    }
    
    func getPlaces() -> [Place] {
        return places
    }
    
    func getSortedPlaces() -> [Place] {
        return places.sorted { $0.dateObject ?? Date() < $1.dateObject ?? Date() }
    }
}
