//
//  BaseBallGridView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct BaseBallGridView: View {
    let rows = [
        GridItem(.fixed(50))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(1...10, id: \.self) { index in
                    BaseBallGridItemView(number: index)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.top, 28)
    }
}

#Preview {
    BaseBallGridView()
}
