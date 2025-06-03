//
//  MasterpieceOfKimghPDGridView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct MasterpieceOfKimghPDGridView: View {
    let rows = [
        GridItem(.fixed(90))
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("김가현PD의 인생작 TOP 5")
                .font(.system(size: 15, weight: .bold))
                .padding(.leading, 12)
                .foregroundStyle(.whiteT)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 8) {
                    ForEach(1...5, id: \.self) { index in
                        MasterpieceOfKimghPDGridItemView(number: index)
                    }
                }
                .padding(.leading, 13)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.top, 25)
    }
}

#Preview {
    MasterpieceOfKimghPDGridView()
}
