//
//  BaseBallGridItemView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct BaseBallGridItemView: View {
    var number: Int
    var body: some View {
        ZStack {
            (number % 2 == 0 ? Color.blackT : Color.whiteT)
                .frame(width: 80, height: 50)
            Image("baseball \(number)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
        }
    }
}
