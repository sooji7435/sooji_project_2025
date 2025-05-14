//
//  Filtering.swift
//  EVCar
//
//  Created by 박윤수 on 5/15/25.
//
import Foundation

class Filtering: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedManufacturer: String = "전체"
    @Published var selectedBodyStyle: String = "전체"
    @Published var selectedYear: String = "전체"
    var sourceRecords: [EVRecord] = []
    // 검색 조건을 처리하는 함수
    private func matchesSearchCriteria(record: EVRecord) -> Bool {
        let matchesManufacturer = selectedManufacturer == "전체" || record.manufacturer == selectedManufacturer
        let matchesBodyStyle = selectedBodyStyle == "전체" || record.bodystyle == selectedBodyStyle
        let matchesYear = selectedYear == "전체" || String(record.year) == selectedYear
        return matchesManufacturer && matchesBodyStyle && matchesYear
    }

    // 검색어가 있을 때, 필터링을 위한 조건을 반환하는 함수
    private func matchesSearchTerm(record: EVRecord) -> Bool {
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return record.model.lowercased().contains(trimmedSearch) || record.manufacturer.lowercased().contains(trimmedSearch)
    }

    var filteredRecords: [EVRecord] {
        // 검색어가 비어 있을 때 필터만 적용
        if searchText.isEmpty {
            return sourceRecords.filter { matchesSearchCriteria(record: $0) }
        } else {
            // 검색어가 있을 경우, 필터와 검색 조건을 함께 적용
            return sourceRecords.filter { matchesSearchCriteria(record: $0) && matchesSearchTerm(record: $0) }
        }
    }

    var allManufacturers: [String] {
        ["전체"] + Array(Set(sourceRecords.map { $0.manufacturer })).sorted()
    }

    var allBodyStyles: [String] {
        ["전체"] + Array(Set(sourceRecords.map { $0.bodystyle })).sorted()
    }

    var allYears: [String] {
        ["전체"] + Array(Set(sourceRecords.map { String($0.year) })).sorted()
    }
}

