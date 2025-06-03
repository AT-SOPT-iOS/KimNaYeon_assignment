//
//  NavigationView.swift
//  TvingCloneBySwiftUI
//
//  Created by 김나연 on 6/3/25.
//

import SwiftUI

struct NavigationBarView: View {
    @State private var navigationSelection = 0
    let navigationSegments = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    @Namespace private var animationNamespace

    var body: some View {
        HStack(spacing: 28) {
            ForEach(0..<navigationSegments.count, id: \.self) { index in
                Button(action: {
                    withAnimation(.easeInOut) {
                        navigationSelection = index
                    }
                }) {
                    VStack(spacing: 7) {
                        Text(navigationSegments[index])
                            .foregroundStyle(.whiteT)
                            .font(.system(size: 16, weight: .medium))

                        ZStack {
                            if navigationSelection == index {
                                Rectangle()
                                    .fill(Color.whiteT)
                                    .frame(width: 15, height: 3)
                                    .matchedGeometryEffect(id: "indicator", in: animationNamespace)
                            } else {
                                Color.clear.frame(width: 15, height: 3)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 18)
    }
}

#Preview {
    NavigationBarView()
}
