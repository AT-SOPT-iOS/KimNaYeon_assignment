//
//  TodayTopTwentyGridView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct TodayTopTwentyGridView: View {
    let rows = [
        GridItem(.fixed(146))
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("오늘의 티빙 TOP 20")
                .font(.system(size: 15, weight: .bold))
                .padding(.leading, 12)
                .foregroundStyle(.whiteT)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 12) {
                    ForEach(1...8, id: \.self) { index in
                        TodayTopTwentyGridItemView(number: index)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.top, 9)
    }
}

#Preview {
    TodayTopTwentyGridView()
}
