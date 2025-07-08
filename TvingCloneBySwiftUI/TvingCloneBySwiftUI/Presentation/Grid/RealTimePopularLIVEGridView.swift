//
//  RealTimePopularLIVEGridView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct RealTimePopularLIVEGridView: View {
    let items = RealTimePopularLIVEGridModel.dummy()
    let rows = [
        GridItem(.fixed(137))
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack() {
                Text("실시간 인기 LIVE")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.whiteT)
                Spacer()
                Button(action: {}) {
                    Text("더보기")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.gray2)
                }
            }
            .padding(.horizontal, 13)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 12) {
                    ForEach(items, id: \.id) { item in
                        RealTimePopularLIVEGridItemView(model: item)
                    }
                }
                .padding(.leading, 13)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.top, 18)
    }
}

#Preview {
    RealTimePopularLIVEGridView()
}
