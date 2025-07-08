//
//  TVGridItemView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct TVGridItemView: View {
    var number: Int
    var body: some View {
        ZStack {
            Color.gray4
                .frame(width: 90, height: 45)
                .cornerRadius(4)
            Image("tv \(number)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 68, height: 34)
        }
    }
}
