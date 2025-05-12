//
//  EVCardView.swift
//  Revolt
//
//  Created by 박윤수 on 5/13/25.
//
import SwiftUI


struct EVCardView: View {
    let record: EVRecord
    @Binding var likedIDs: Set<String>

    var isLiked: Bool {
        likedIDs.contains(record.id)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(record.make) \(record.model)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .lineLimit(1)
                
                Text("연식: \(record.modelYear) • \(record.city), \(record.state)")
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .lineLimit(1)
            }
            Spacer()

            Button(action: {
                if isLiked {
                    likedIDs.remove(record.id)
                } else {
                    likedIDs.insert(record.id)
                }
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isLiked ? .red : .gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
