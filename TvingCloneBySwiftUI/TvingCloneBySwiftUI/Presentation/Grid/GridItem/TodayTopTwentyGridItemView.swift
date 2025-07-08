//
//  TodayTopTwentyGridItemView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct TodayTopTwentyGridItemView: View {
    var number: Int
    var body: some View {
        HStack(alignment: .bottom) {
            Text("\(number)")
                .font(.system(size: 50))
                .italic()
                .foregroundStyle(.whiteT)
            Image("movie \(number)")
                .resizable()
                .frame(width: 98, height: 146)
                .cornerRadius(3)
                .clipped()
        }
    }
}
