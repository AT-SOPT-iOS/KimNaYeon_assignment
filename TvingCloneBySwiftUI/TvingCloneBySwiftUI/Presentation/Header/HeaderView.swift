//
//  HeaderView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(uiImage: .tvingLogoClear)
                .resizable()
                .frame(width: 191, height: 78)
            Spacer()
            Button(action: {}) {
                Image(uiImage: .search)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.trailing, 10)
            Button(action: {}) {
                Image(uiImage: .tvingCharactor)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.trailing, 11)
        }
    }
}

#Preview {
    HeaderView()
}
