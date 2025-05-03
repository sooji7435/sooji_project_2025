import SwiftUI

struct EVDetailView: View {
    let record: EVRecord

    var body: some View {
        Form {
            Section(header: Text("기본 정보")) {
                Text("VIN: \(record.vin)")
                Text("제조사: \(record.make)")
                Text("모델: \(record.model)")
                Text("연식: \(record.modelYear)")
                Text("차량 유형: \(record.vehicleType)")
            }

            Section(header: Text("주행 정보")) {
                Text("전기 주행 거리: \(record.rangeMiles) 마일")
                Text("CAFV 적격 여부: \(record.fuelEligibility)")
            }

            Section(header: Text("위치 정보")) {
                Text("지역: \(record.city), \(record.county), \(record.state) \(record.postalCode)")
                Text("좌표: \(record.coordinates)")
            }

            Section(header: Text("기타")) {
                Text("Vehicle ID: \(record.vehicleID)")
                Text("법률 지구: \(record.legislativeDistrict)")
                Text("FIPS 코드: \(record.fipsCode)")
                Text("전기 공급자: \(record.jurisdictions)")
            }
        }
        .navigationTitle("\(record.make) \(record.model)")
    }
}
