//
//  ViewController.swift
//  MatWarrior
//
//  Created by 유상민 on 2023/10/03.
//

import UIKit
import NMapsMap

class ViewController: UIViewController, NMFMapViewTouchDelegate, NMFMapViewCameraDelegate {
    
    var viewModel = PlaceViewModel()
    var markers: [NMFMarker] = []
    var infoWindow = NMFInfoWindow()
    var naverMapView: NMFNaverMapView!
    let dataSource = NMFInfoWindowDefaultTextSource.data()
    var bottomSheetVC: BottomSheetViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.mapView.touchDelegate = self
        naverMapView.mapView.addCameraDelegate(delegate: self)
        view.addSubview(naverMapView)
        
        naverMapView.showLocationButton = true
        naverMapView.mapView.zoomLevel = 6.2
        naverMapView.mapView.positionMode = .compass
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 36.5177, lng: 127.8173))
        naverMapView.mapView.moveCamera(cameraUpdate)
        
        markers = viewModel.places.map({ place in
            let marker = addMarker(for: place, on: naverMapView.mapView)
            return marker
        })
        
        dataSource.title = "정보 창 내용"
        infoWindow.dataSource = dataSource
        
        // 마커를 탭하면:
        let handler = { [weak self] (overlay: NMFOverlay) -> Bool in
            if let marker = overlay as? NMFMarker,
                let place = self?.place(for: marker) {
                // 현재 마커에 연결된 Place 객체의 이름으로 정보 창 내용 설정
                self?.dataSource.title = place.name
                self?.infoWindow.open(with: marker)
                
                // 바텀시트 뷰 컨트롤러를 생성하고 정보 전달
                let newBottomSheetVC = BottomSheetViewController()
                newBottomSheetVC.place = place
                
                // 만약 이미 bottomSheetVC가 있다면, 기존 것을 제거
                self?.bottomSheetVC?.view.removeFromSuperview()
                self?.bottomSheetVC?.removeFromParent()
                
                // 새로운 뷰 컨트롤러를 설정하고 추가
                self?.bottomSheetVC = newBottomSheetVC
                self?.addChild(newBottomSheetVC)
                newBottomSheetVC.view.frame = CGRect(x: 0, y: self?.view.frame.height ?? 0 - 300, width: self?.view.frame.width ?? 0, height: 300)
                self?.view.addSubview(newBottomSheetVC.view)
                newBottomSheetVC.didMove(toParent: self)
                
                // 바텀시트 뷰 애니메이션
                UIView.animate(withDuration: 0.3) {
                    if let height = self?.view.frame.height {
                        self?.bottomSheetVC?.view.frame.origin.y = height - 350
                    }
                }
            } else {
                // 마커가 아닌 다른 영역을 탭하면 정보 창 닫기
                self?.infoWindow.close()
                
                // 추가된 부분: 바텀시트 뷰 닫기
                self?.bottomSheetVC?.view.removeFromSuperview()
                self?.bottomSheetVC?.removeFromParent()
            }
            return true
        }
        
        markers.forEach { marker in
            marker.touchHandler = handler
        }
        
    }
    
    // 지도를 탭하면 정보 창을 닫음
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        infoWindow.close()
        
        // 바텀시트 뷰를 닫음
        if let bottomSheetVC = children.first as? BottomSheetViewController {
            UIView.animate(withDuration: 0.3) {
                bottomSheetVC.view.frame.origin.y = self.view.frame.height
            }
        }
    }
    
    // 마커 생성
    func addMarker(for place: Place, on mapView: NMFMapView) -> NMFMarker {
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: place.latitude, lng: place.longitude)
        marker.iconImage = NMFOverlayImage(name: "MarWarriorMarker")
        marker.iconTintColor = UIColor.black
        marker.width = 35
        marker.height = 35
        marker.mapView = mapView
        
        return marker
    }
    
    // 해당 마커에 연결된 Place 객체를 찾아서 변환
    func place(for marker: NMFMarker) -> Place? {
        // 해당 마커에 연결된 Place 객체를 찾아서 반환
        guard let index = markers.firstIndex(of: marker),
              viewModel.places.indices.contains(index) else {
            return nil
        }
        return viewModel.places[index]
    }
}


