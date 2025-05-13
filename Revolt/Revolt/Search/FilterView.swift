import SwiftUI
import CoreML

struct FilterView: View {
    @ObservedObject var viewModel: Load

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - 가로형 필터 바
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        // 제조사 필터
                        Menu {
                            Picker("제조사", selection: $viewModel.selectedManufacturer) {
                                ForEach(viewModel.allManufacturers, id: \.self) { Text($0) }
                            }
                        } label: {
                            FilterLabel(title: viewModel.selectedManufacturer.isEmpty ? "제조사" : viewModel.selectedManufacturer)
                        }
                        
                        // 바디 스타일 필터
                        Menu {
                            Picker("바디 스타일", selection: $viewModel.selectedBodyStyle) {
                                ForEach(viewModel.allBodyStyles, id: \.self) { Text($0) }
                            }
                        } label: {
                            FilterLabel(title: viewModel.selectedBodyStyle.isEmpty ? "바디 스타일" : viewModel.selectedBodyStyle)
                        }
                        
                        // 연도 필터
                        Menu {
                            Picker("연도", selection: $viewModel.selectedYear) {
                                ForEach(viewModel.allYears, id: \.self) { Text($0) }
                            }
                        } label: {
                            FilterLabel(title: viewModel.selectedYear.isEmpty ? "연도" : viewModel.selectedYear)
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
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}
