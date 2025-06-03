//
//  TVGridView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct TVGridView: View {
    let rows = [
        GridItem(.fixed(45))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 7) {
                ForEach(1...4, id: \.self) { index in
                    TVGridItemView(number: index)
                }
            }
            .padding(.leading, 15)
        }
        .scrollIndicators(.hidden)
        .padding(.top, 28)
    }
}

#Preview {
    TVGridView()
}
