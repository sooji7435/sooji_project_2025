import Foundation

// EVRecord 구조체 정의
struct EVRecord: Identifiable, Codable {
    var id = UUID()
    let model: String
    let year: Int
    let bodystyle: String
    let platform: String
    let battery: String
    let manufacturer: String
    let marque: String
    
    enum CodingKeys: String, CodingKey {
            case model = "Model"
            case year = "Calendar year\nproduced"
            case bodystyle = "Body style"
            case platform = "Platform"
            case battery = "Dedicated battery\nelectric vehicle?[nb 1]"
            case manufacturer = "Manufacturer"
            case marque = "Marque origin"
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
        guard let fileURL = Bundle.main.url(forResource: "list", withExtension: "json"),
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


