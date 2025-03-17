import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    static let shared = LocationManager() // 싱글톤
    var locationManager = CLLocationManager()
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .notDetermined:
                print("디버깅: notDetermined - 권한 요청 중")
                manager.requestWhenInUseAuthorization()
            case .denied:
                print("디버깅: denied - 사용자 거부")
            case .restricted:
                print("디버깅: restricted - 제한됨")
            case .authorizedWhenInUse, .authorizedAlways:
                print("디버깅: authorized - 위치 업데이트 시작")
                manager.startUpdatingLocation()
            default:
                print("디버깅: default - 알 수 없는 상태")
            }
        }
    
    //위치 업데이트 시작
    func startLocationUpdate() {
        locationManager.startUpdatingLocation()
    }
    
    //위치 업데이트 중지
    func stopLocationUpdate() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            locations.last.map {
                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            }
        }
}
