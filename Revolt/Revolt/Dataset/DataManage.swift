import Foundation

// EVRecord 구조체 정의
struct EVRecord: Identifiable, Codable {
    let model: String
    let year: String
    let bodystyle: String
    let platform: String
    let battery: String
    let manufacturer: String
    let marque: String
    
    var id: UUID
    
    enum CodingKeys: String, CodingKey {
            case model = "Model"
            case year = "Calendar year\nproduced"
            case bodystyle = "Body style"
            case platform = "Platform"
            case battery = "Dedicated battery\nelectric vehicle?[nb 1]"
            case manufacturer = "Manufacturer"
            case marque = "Marque origin"
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = UUID()
        
        model = try container.decodeLosslessString(forKey: .model)
        year = try container.decodeLosslessString(forKey: .year)
        bodystyle = try container.decodeLosslessString(forKey: .bodystyle)
        platform = try container.decodeLosslessString(forKey: .platform)
        battery = try container.decodeLosslessString(forKey: .battery)
        manufacturer = try container.decodeLosslessString(forKey: .manufacturer)
        marque = try container.decodeLosslessString(forKey: .marque)
    }
    
}

extension KeyedDecodingContainer {
    func decodeLosslessString(forKey key: KeyedDecodingContainer<K>.Key) throws -> String {
        if let stringValue = try? self.decode(String.self, forKey: key) {
            return stringValue
        } else if let intValue = try? self.decode(Int.self, forKey: key) {
            return String(intValue)
        } else if let doubleValue = try? self.decode(Double.self, forKey: key) {
            return String(doubleValue)
        } else {
            throw DecodingError.typeMismatch(
                String.self,
                DecodingError.Context(
                    codingPath: [key],
                    debugDescription: "Expected String-compatible type for key '\(key.stringValue)'"
                )
            )
        }
    }
}

class Load: ObservableObject {
    @Published var records: [EVRecord] = []
    @Published var isLoading: Bool = true
    @Published var likedIDs: Set<String> = []
    
    @Published var searchText: String = ""
    @Published var selectedManufacturer: String = "전체"
    @Published var selectedBodyStyle: String = "전체"
    @Published var selectedYear: String = "전체"

    
    var filteredRecords: [EVRecord] {
        // 검색어가 비어 있으면 필터만 적용
        if searchText.isEmpty {
            return records.filter { record in
                let matchesManufacturer = selectedManufacturer == "전체" || record.manufacturer == selectedManufacturer
                let matchesBodyStyle = selectedBodyStyle == "전체" || record.bodystyle == selectedBodyStyle
                let matchesYear = selectedYear == "전체" || record.year == selectedYear
                
                return matchesManufacturer && matchesBodyStyle && matchesYear
            }
        } else {
            // 검색어가 있을 경우, 필터 조건을 적용
            return records.filter { record in
                let matchesManufacturer = selectedManufacturer == "전체" || record.manufacturer == selectedManufacturer
                let matchesBodyStyle = selectedBodyStyle == "전체" || record.bodystyle == selectedBodyStyle
                let matchesYear = selectedYear == "전체" || record.year == selectedYear
                
                let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                let matchesSearch = record.model.lowercased().contains(trimmedSearch) || record.manufacturer.lowercased().contains(trimmedSearch)
                
                return matchesManufacturer && matchesBodyStyle && matchesYear && matchesSearch
            }
        }
    }
    
    var allManufacturers: [String] {
            ["전체"] + Array(Set(records.map { $0.manufacturer })).sorted()
        }

        var allBodyStyles: [String] {
            ["전체"] + Array(Set(records.map { $0.bodystyle })).sorted()
        }

        var allYears: [String] {
            ["전체"] + Array(Set(records.map { $0.year })).sorted()
        }
    
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


