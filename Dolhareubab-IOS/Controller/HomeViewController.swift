//
//  ViewController.swift
//  Dolhareubab-IOS
//
//  Created by 고명주 on 2022/12/14.
//

import UIKit
import CoreLocation
import Alamofire

class HomeViewController: UIViewController, CLLocationManagerDelegate {
  
  var locationManger = CLLocationManager()
  var a: CLLocationDegrees? = 127.1086228
  var b: CLLocationDegrees? = 37.4012191
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 델리게이트 설정
    locationManger.delegate = self
    // 거리 정확도 설정
    locationManger.desiredAccuracy = kCLLocationAccuracyBest
    // 사용자에게 허용 받기 alert 띄우기
    locationManger.requestWhenInUseAuthorization()
    
    // 아이폰 설정에서의 위치 서비스가 켜진 상태라면
    if CLLocationManager.locationServicesEnabled() {
      print("위치 서비스 On 상태")
      locationManger.startUpdatingLocation() //위치 정보 받아오기 시작
      print(locationManger.location?.coordinate)
      var url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=\(a!)&y=\(b!)&input_coord=WGS84"
      AF.request(url,
                 method: .get,
                 parameters: nil,
                 encoding: URLEncoding.default,
                 headers: ["Content-Type": "application/json",
                           "Authorization": "KakaoAK acfc612bdbea57bc9d8b49572beeb70a"])
      .validate(statusCode: 200..<300)
      .responseDecodable(of: LocationModel.self, completionHandler: { response in
        print("hihi")
        
      })
//      .responseJSON { (json) in
//        let decoder = JSONDecoder()
//        do {
//             let users = try decoder.decode(LocationModel.self, from: json)
//             print("Users list :", users)
//            } catch {
//             print(error)
//         }
        
//        print(json)
//      }
    } else {
      print("위치 서비스 Off 상태")
    }
  }
  
  // 위치 정보 계속 업데이트 -> 위도 경도 받아옴
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print("didUpdateLocations")
    if let location = locations.first {
      a = location.coordinate.latitude
      b = location.coordinate.longitude
      print("위도: \(location.coordinate.latitude)")
      print("경도: \(location.coordinate.longitude)")
    }
  }
  
  // 위도 경도 받아오기 에러
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
}
