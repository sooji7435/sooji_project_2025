import Foundation

// EVRecord 구조체 정의
struct EVRecord: Identifiable, Codable {
    let vin: String
    let county: String
    let city: String
    let state: String
    let postalCode: String
    let modelYear: String
    let make: String
    let model: String
    let vehicleType: String
    let fuelEligibility: String
    let rangeMiles: String
    let baseMSRP: String
    let legislativeDistrict: String
    let vehicleID: String
    let coordinates: String
    let jurisdictions: String
    let fipsCode: String

    var id: String { vin }

    enum CodingKeys: String, CodingKey {
        case vin = "VIN (1-10)"
        case county = "County"
        case city = "City"
        case state = "State"
        case postalCode = "Postal Code"
        case modelYear = "Model Year"
        case make = "Make"
        case model = "Model"
        case vehicleType = "Electric Vehicle Type"
        case fuelEligibility = "Clean Alternative Fuel Vehicle (CAFV) Eligibility"
        case rangeMiles = "Electric Range"
        case baseMSRP = "Base MSRP"
        case legislativeDistrict = "Legislative District"
        case vehicleID = "DOL Vehicle ID"
        case coordinates = "Vehicle Location"
        case jurisdictions = "Electric Utility"
        case fipsCode = "2020 Census Tract"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        vin = try container.decodeLosslessString(forKey: .vin)
        county = try container.decodeLosslessString(forKey: .county)
        city = try container.decodeLosslessString(forKey: .city)
        state = try container.decodeLosslessString(forKey: .state)
        postalCode = try container.decodeLosslessString(forKey: .postalCode)
        modelYear = try container.decodeLosslessString(forKey: .modelYear)
        make = try container.decodeLosslessString(forKey: .make)
        model = try container.decodeLosslessString(forKey: .model)
        vehicleType = try container.decodeLosslessString(forKey: .vehicleType)
        fuelEligibility = try container.decodeLosslessString(forKey: .fuelEligibility)
        rangeMiles = try container.decodeLosslessString(forKey: .rangeMiles)
        baseMSRP = try container.decodeLosslessString(forKey: .baseMSRP)
        legislativeDistrict = try container.decodeLosslessString(forKey: .legislativeDistrict)
        vehicleID = try container.decodeLosslessString(forKey: .vehicleID)
        coordinates = try container.decodeLosslessString(forKey: .coordinates)
        jurisdictions = try container.decodeLosslessString(forKey: .jurisdictions)
        fipsCode = try container.decodeLosslessString(forKey: .fipsCode)
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


func loadJSONInChunks(from jsonName: String, chunkSize: Int = 1000, onChunk: @escaping ([EVRecord]) -> Void, onFinish: @escaping () -> Void) {
    DispatchQueue.global(qos: .userInitiated).async {
        print("🔍 [loadJSONInChunks] Trying to load JSON file: \(jsonName).json")
        
        guard let fileURL = Bundle.main.url(forResource: jsonName, withExtension: "json"),
              let data = try? Data(contentsOf: fileURL) else {
            print("❌ [loadJSONInChunks] Failed to load file or data")
            DispatchQueue.main.async {
                onChunk([])
                onFinish()
            }
            return
        }

        do {
            let decoder = JSONDecoder()
            let allRecords = try decoder.decode([EVRecord].self, from: data)
            print("✅ [loadJSONInChunks] Successfully decoded \(allRecords.count) records")

            var chunk: [EVRecord] = []

            for (index, record) in allRecords.enumerated() {
                chunk.append(record)

                if chunk.count == chunkSize || index == allRecords.count - 1 {
                    let toSend = chunk
                    chunk = []

                    DispatchQueue.main.async {
                        print("📦 Sending chunk of size: \(toSend.count)")
                        onChunk(toSend)
                    }

                    usleep(10000) // 10ms 지연
                }
            }

            DispatchQueue.main.async {
                print("🏁 Finished loading all chunks")
                onFinish()
            }
        } catch {
            print("❌ [loadJSONInChunks] JSON decoding error: \(error)")
            DispatchQueue.main.async {
                onChunk([])
                onFinish()
            }
        }
    }
}

