//
//  Recommend.swift
//  Revolt
//
//  Created by 박윤수 on 5/13/25.
//
import Foundation
import CoreML
import SwiftUI

class Recommend {
    @Published var suggestionArticleList: [String] = []
    
    private var recommendationModel: RecommendModel = {
        do {
            let config = MLModelConfiguration()
            return try RecommendModel(configuration: config)
        } catch {
            fatalError("추천모델을 찾지 못했습니다")
        }
    }()
    
    private var recommendationData: [String: Double] = [:] {
            didSet {
                updateRecommendations()
            }
        }
    
    func storeUserLikeData(key: String, value: Double) {
            recommendationData[key] = value
        }
    
    private func updateRecommendations() {
            do {
                let input = RecommendModelInput(items: recommendationData, k: 5)
                let result = try recommendationModel.prediction(input: input)
                DispatchQueue.main.async {
                    self.suggestionArticleList = result.recommendations
                }
            } catch {
                print("❌ 추천 실패: \(error)")
            }
        }
}

class RecommendViewModel: ObservableObject {
    @Published var articles: [Article] = [
        Article(name: "AI 소개", isLiked: false),
        Article(name: "SwiftUI 기초", isLiked: false),
        Article(name: "CoreML 튜토리얼", isLiked: false),
        Article(name: "WWDC 정리", isLiked: false)
    ]

    @Published var recommend = Recommend()

    func toggleLike(for article: Article) {
        guard let index = articles.firstIndex(where: { $0.name == article.name }) else { return }
        articles[index].isLiked.toggle()
        recommend.storeUserLikeData(
            key: article.name,
            value: articles[index].isLiked ? 1.0 : 0.0
        )
    }
}

struct Article {
    var name: String
    var isLiked: Bool
}

