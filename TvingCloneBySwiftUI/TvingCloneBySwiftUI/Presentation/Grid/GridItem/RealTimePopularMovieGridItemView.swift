//
//  RealTimePopularMovieGridItemView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct RealTimePopularMovieGridItemView: View {
    var number: Int
    var body: some View {
        HStack(alignment: .bottom) {
            Image("movie \(number)")
                .resizable()
                .frame(width: 98, height: 146)
                .cornerRadius(3)
                .clipped()
        }
    }
}
