import Foundation

/*
 "Name": "Lucid Air Dream Edition P",
 "Subtitle": "118 kWh useable battery          Available since January 2022",
 "Acceleration": "2.7 sec",
 "TopSpeed": "270 km/h",
 "Range": "645 km",
 "Efficiency": "183 Wh/km",
 "FastChargeSpeed": "820 km/h",
 "Drive": "All Wheel Drive",
 "NumberofSeats": 5,
 "PriceinGermany": "€218,000",
 "PriceinUK": "N/A"
 */

// EVRecord 구조체 정의
struct EVRecord: Identifiable, Codable {
    var id = UUID()
    let name: String
    let subtitle: String
    let acceleration: String
    let topspeed: String
    let range: String
    let efficiency: String
    let fastchargespeed: String
    let drive: String
    let numberofseats: Int
    let priceingermany: String
    let priceinuk: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case subtitle = "Subtitle"
        case acceleration = "Acceleration"
        case topspeed = "TopSpeed"
        case range = "Range"
        case efficiency = "Efficiency"
        case fastchargespeed = "FastChargeSpeed"
        case drive = "Drive"
        case numberofseats = "NumberofSeats"
        case priceingermany = "PriceinGermany"
        case priceinuk = "PriceinUK"
        }
}



class Load: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var likedIDs: Set<String> = []
    @Published var records: [EVRecord] = []

    init() {
        loadEVData()
    }
    
    // JSON 데이터 로딩 함수
    func loadEVData() {
        // JSON 파일 로드
        guard let fileURL = Bundle.main.url(forResource: "EV_list", withExtension: "json"),
              let data = try? Data(contentsOf: fileURL) else {
            print("❌ 파일을 찾을 수 없습니다.")
            isLoading = false
            return
        }
        
        do {
            let decoder = JSONDecoder()
            // JSON 데이터를 디코딩하여 records 배열에 저장
            records = try decoder.decode([EVRecord].self, from: data)
            print("✅ 데이터 로딩 완료: \(records.count) 개의 전기차")
        } catch {
            print("❌ JSON 디코딩 실패: \(error)")
        }
        
        isLoading = false
    }
}


