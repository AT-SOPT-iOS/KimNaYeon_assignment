//
//  MasterpieceOfKimghPDGridItemView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct MasterpieceOfKimghPDGridItemView: View {
    var number: Int
    var body: some View {
        Image("drama \(number)")
            .resizable()
            .frame(width: 160, height: 90)
            .cornerRadius(3)
            .clipped()
    }
}
