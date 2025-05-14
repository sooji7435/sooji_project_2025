import SwiftUI
import CoreML

struct FilterView: View {
    @ObservedObject var load: Load
    @ObservedObject var filter: Filtering

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - 가로형 필터 바
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        // 제조사 필터
                        Menu {
                            Picker("제조사", selection: $filter.selectedManufacturer) {
                                ForEach(filter.allManufacturers, id: \.self) { Text($0) }
                            }
                        } label: {
                            FilterLabel(title: filter.selectedManufacturer.isEmpty ? "제조사" : filter.selectedManufacturer)
                        }
                        
                        // 바디 스타일 필터
                        Menu {
                            Picker("바디 스타일", selection: $filter.selectedBodyStyle) {
                                ForEach(filter.allBodyStyles, id: \.self) { Text($0) }
                            }
                        } label: {
                            FilterLabel(title: filter.selectedBodyStyle.isEmpty ? "바디 스타일" : filter.selectedBodyStyle)
                        }
                        
                        // 연도 필터
                        Menu {
                            Picker("연도", selection: $filter.selectedYear) {
                                ForEach(filter.allYears, id: \.self) { Text($0) }
                            }
                        } label: {
                            FilterLabel(title: filter.selectedYear.isEmpty ? "연도" : filter.selectedYear)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

// MARK: - 필터 라벨 뷰
struct FilterLabel: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .foregroundStyle(.black)
            .background(.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}
