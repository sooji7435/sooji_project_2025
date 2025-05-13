//
//  Recommend.swift
//  Revolt
//
//  Created by 박윤수 on 5/13/25.
//
import Foundation
import CoreML

import Foundation
import CoreML

class Recommend {
    
    private var recommendationModel: Model = {
        do {
            let config = MLModelConfiguration()
            return try Model(configuration: config)
        } catch {
            fatalError("❌ 추천 모델을 불러올 수 없습니다: \(error.localizedDescription)")
        }
    }()
    
    // 사용자 선호 데이터 저장용 딕셔너리
    /*private var userPreferences: [String: Double] = [:]
    
    /// 사용자 선호도 저장
    func storeUserLikeData(key: String, value: Double) {
        userPreferences[key] = value
    }
    
    /// 추천 결과 생성
    func recommend() -> [String: Any]? {
        do {
            // 1. 딕셔너리를 MLFeatureProvider로 변환
            let inputFeatures = try MLDictionaryFeatureProvider(dictionary: userPreferences)
            
            // 2. CoreML 모델 예측
            let prediction = try recommendationModel.prediction(input: inputFeatures)
            
            // 3. 결과 추출
            var result: [String: Any] = [:]
            for output in prediction.featureNames {
                let value = prediction.featureValue(for: output)
                result[output] = value?.value
            }
            return result
            
        } catch {
            print("❗️예측 중 오류 발생: \(error.localizedDescription)")
            return nil
        }
    }*/
}

    
    

