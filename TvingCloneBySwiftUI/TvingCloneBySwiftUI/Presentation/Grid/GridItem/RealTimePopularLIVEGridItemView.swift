//
//  RealTimePopularLIVEGridItemView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct RealTimePopularLIVEGridItemView: View {
    let model: RealTimePopularLIVEGridModel
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Image(model.image)
                .resizable()
                .frame(width: 160, height: 80)
                .cornerRadius(3)
                .clipped()
            HStack(alignment: .top) {
                Text(model.count)
                    .font(.system(size: 19))
                    .italic()
                    .foregroundStyle(.whiteT)
                VStack(alignment: .leading) {
                    Text(model.name)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundStyle(.whiteT)
                    Text(model.episodes)
                        .font(.system(size: 10))
                        .foregroundStyle(.gray2)
                    Text(model.rating)
                        .font(.system(size: 10))
                        .foregroundStyle(.gray2)
                }
            }
            .padding(.leading, 6)
        }
    }
}
